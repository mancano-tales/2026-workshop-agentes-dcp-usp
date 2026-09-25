# =============================================================================
# registrar_acoes.R  — hook PostToolUse (rastreabilidade / traceability)
#
# PT: Acrescenta uma linha em logs/registro-agente.jsonl para cada ação do
#     agente (qual ferramenta, qual arquivo ou comando, quando). É o "caderno de
#     laboratório" automático: permite reconstruir depois o que o agente fez,
#     mesmo que a conversa se perca.
#
# EN: Appends one line to logs/registro-agente.jsonl for every agent action
#     (which tool, which file or command, when). An automatic lab notebook:
#     lets you reconstruct later what the agent did, even if the chat is lost.
# =============================================================================

`%||%` <- function(x, y) if (is.null(x)) y else x

entrada <- jsonlite::fromJSON(
  paste(readLines(file("stdin"), warn = FALSE), collapse = "\n"),
  simplifyVector = FALSE
)

parametros <- entrada$tool_input %||% list()

registro <- list(
  momento    = format(Sys.time(), "%Y-%m-%dT%H:%M:%S%z"),
  sessao     = entrada$session_id %||% NA,
  ferramenta = entrada$tool_name %||% NA,
  # PT: guarda só o alvo da ação, não o conteúdo inteiro escrito.
  # EN: store only the target of the action, not the full written content.
  alvo       = parametros$file_path %||% parametros$command %||% NA
)

raiz <- Sys.getenv("CLAUDE_PROJECT_DIR", unset = getwd())
dir.create(file.path(raiz, "logs"), showWarnings = FALSE)

cat(
  jsonlite::toJSON(registro, auto_unbox = TRUE, na = "null"), "\n",
  sep = "",
  file = file.path(raiz, "logs", "registro-agente.jsonl"),
  append = TRUE
)

quit(status = 0)
