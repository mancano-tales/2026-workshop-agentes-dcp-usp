# =============================================================================
# validar_apos_escrita.R  — hook PostToolUse e Stop
#
# PT: Valida dados/processados/codificacao.csv com R/validar_codificacao.R
#     sempre que o arquivo puder ter mudado, qualquer que seja o caminho:
#     - depois de Edit/Write/MultiEdit nesse arquivo;
#     - depois de qualquer comando Bash, se o conteúdo do arquivo mudou desde a
#       última validação (um script R ou um redirecionamento do shell também
#       gravam o arquivo, e o hook não pode depender de qual ferramenta foi usada);
#     - quando o agente tenta encerrar a tarefa (evento Stop).
#     Se a validação falhar, devolve os problemas ao agente (exit 2), que precisa
#     corrigir o arquivo antes de seguir. O agente não "decide" se valida.
#
# EN: Validates dados/processados/codificacao.csv with R/validar_codificacao.R
#     whenever the file may have changed, whatever the route: after
#     Edit/Write/MultiEdit on it; after any Bash command if its content changed
#     since the last validation; and when the agent tries to stop (Stop event).
#     On failure, problems are fed back to the agent (exit 2).
# =============================================================================

`%||%` <- function(x, y) if (is.null(x)) y else x

entrada <- jsonlite::fromJSON(
  paste(readLines(file("stdin"), warn = FALSE), collapse = "\n"),
  simplifyVector = FALSE
)

# PT: O hook roda na raiz do projeto, onde o validador espera dados/brutos/.
# EN: Run from the project root, where the validator expects dados/brutos/.
raiz <- Sys.getenv("CLAUDE_PROJECT_DIR", unset = getwd())
setwd(raiz)

alvo <- "dados/processados/codificacao.csv"
marca <- "logs/.codificacao-validada.md5"
evento <- entrada$hook_event_name %||% "PostToolUse"
ferramenta <- entrada$tool_name %||% ""
caminho <- gsub("\\\\", "/", entrada$tool_input$file_path %||% "")

if (!file.exists(alvo)) quit(status = 0)

hash_atual <- unname(tools::md5sum(alvo))
hash_validado <- if (file.exists(marca)) readLines(marca, warn = FALSE)[1] else ""

precisa_validar <- switch(
  evento,
  # PT: Ao encerrar, valida sempre. Se o próprio Stop já foi bloqueado uma vez
  #     (stop_hook_active), não bloqueia de novo, para não prender o agente
  #     num laço; o erro continua aparecendo na tela.
  # EN: On Stop, always validate, but do not block twice in a row.
  Stop = TRUE,
  PostToolUse = if (ferramenta == "Bash") {
    !identical(hash_atual, hash_validado)
  } else {
    grepl(alvo, caminho, fixed = TRUE)
  },
  FALSE
)

if (!precisa_validar) quit(status = 0)

saida <- suppressWarnings(system2(
  "Rscript", c("R/validar_codificacao.R", alvo),
  stdout = TRUE, stderr = TRUE
))
status <- attr(saida, "status") %||% 0L

if (status == 0) {
  dir.create("logs", showWarnings = FALSE)
  writeLines(hash_atual, marca)
  quit(status = 0)
}

message(
  "O arquivo de codificação não passou na validação automática ",
  "(R/validar_codificacao.R). Corrija os problemas abaixo antes de continuar:\n",
  paste(saida, collapse = "\n")
)
if (identical(evento, "Stop") && isTRUE(entrada$stop_hook_active)) quit(status = 0)
quit(status = 2)
