# =============================================================================
# validar_apos_escrita.R  — hook PostToolUse
#
# PT: Roda DEPOIS de cada escrita do agente. Se o arquivo escrito for
#     dados/processados/codificacao.csv, executa R/validar_codificacao.R. Se a
#     validação falhar, devolve os problemas ao agente (exit 2), que então
#     precisa corrigir o arquivo antes de seguir. O agente não "decide" se
#     valida: a validação acontece sempre.
#
# EN: Runs AFTER every write by the agent. If the written file is
#     dados/processados/codificacao.csv, it runs R/validar_codificacao.R. If
#     validation fails, the problems are fed back to the agent (exit 2), which
#     must then fix the file before moving on. The agent does not "decide"
#     whether to validate: validation always happens.
# =============================================================================

`%||%` <- function(x, y) if (is.null(x)) y else x

entrada <- jsonlite::fromJSON(
  paste(readLines(file("stdin"), warn = FALSE), collapse = "\n"),
  simplifyVector = FALSE
)

caminho <- gsub("\\\\", "/", entrada$tool_input$file_path %||% "")

# PT: Só nos interessa o arquivo de codificação; qualquer outra escrita passa.
# EN: Only the coding file matters; any other write passes through.
if (!grepl("dados/processados/codificacao.csv", caminho, fixed = TRUE)) {
  quit(status = 0)
}

# PT: O hook roda na raiz do projeto (CLAUDE_PROJECT_DIR), onde o script de
#     validação espera encontrar dados/brutos/.
# EN: Run from the project root, where the validator expects dados/brutos/.
raiz <- Sys.getenv("CLAUDE_PROJECT_DIR", unset = getwd())
setwd(raiz)

saida <- suppressWarnings(system2(
  "Rscript", c("R/validar_codificacao.R", shQuote(caminho)),
  stdout = TRUE, stderr = TRUE
))
status <- attr(saida, "status") %||% 0L

if (status != 0) {
  message(
    "O arquivo de codificação não passou na validação automática ",
    "(R/validar_codificacao.R). Corrija os problemas abaixo antes de continuar:\n",
    paste(saida, collapse = "\n")
  )
  quit(status = 2)
}

quit(status = 0)
