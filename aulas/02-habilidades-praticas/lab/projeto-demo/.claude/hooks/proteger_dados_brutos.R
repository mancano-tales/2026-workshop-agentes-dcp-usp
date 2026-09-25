# =============================================================================
# proteger_dados_brutos.R  — hook PreToolUse
#
# PT: Roda ANTES de cada ação de edição/escrita ou comando de terminal do
#     agente. Se a ação tentar modificar algo em dados/brutos/, o hook bloqueia
#     (exit 2) e devolve ao agente uma explicação no stderr. É o equivalente a
#     um git hook "pre-commit": a regra dispara sempre, independentemente do
#     "bom senso" do modelo ou do que estiver escrito no AGENTS.md.
#
# EN: Runs BEFORE every edit/write action or shell command by the agent. If the
#     action tries to modify anything under dados/brutos/, the hook blocks it
#     (exit 2) and returns an explanation to the agent on stderr. Analogous to
#     a git "pre-commit" hook: the rule always fires, regardless of the model's
#     judgement or what AGENTS.md says.
#
# Protocolo / Protocol (Claude Code hooks):
#   - stdin: JSON com tool_name e tool_input / JSON with tool_name, tool_input
#   - exit 0: permite a ação / allow
#   - exit 2: bloqueia; stderr é mostrado ao agente / block; stderr goes to agent
# =============================================================================

`%||%` <- function(x, y) if (is.null(x)) y else x

entrada <- jsonlite::fromJSON(
  paste(readLines(file("stdin"), warn = FALSE), collapse = "\n"),
  simplifyVector = FALSE
)

ferramenta <- entrada$tool_name %||% ""
parametros <- entrada$tool_input %||% list()

pasta_protegida <- "dados/brutos"

bloquear <- function(motivo) {
  message(
    "BLOQUEADO pelo hook proteger_dados_brutos.R: ", motivo, "\n",
    "Os dados brutos são somente leitura neste projeto (ver AGENTS.md). ",
    "Grave resultados em dados/processados/."
  )
  quit(status = 2)
}

# -----------------------------------------------------------------------------
# Caso 1 / Case 1: ferramentas de edição de arquivos / file editing tools
# -----------------------------------------------------------------------------
if (ferramenta %in% c("Edit", "Write", "MultiEdit", "NotebookEdit")) {
  caminho <- parametros$file_path %||% parametros$notebook_path %||% ""
  # PT: normaliza separadores do Windows para a comparação funcionar em qualquer SO.
  # EN: normalise Windows separators so the check works on any OS.
  caminho <- gsub("\\\\", "/", caminho)
  if (grepl(pasta_protegida, caminho, fixed = TRUE)) {
    bloquear(paste0("tentativa de ", ferramenta, " em ", caminho, "."))
  }
}

# -----------------------------------------------------------------------------
# Caso 2 / Case 2: comandos de terminal / shell commands
#   PT: Ler dados brutos (cat, head, read_csv) é permitido; o que se bloqueia
#       são comandos que mencionam a pasta protegida E têm cara de escrita.
#       É uma heurística propositalmente simples para fins didáticos — na vida
#       real, combine com permissões do sistema de arquivos (chmod -w) ou com
#       montagem somente leitura no contêiner.
#   EN: Reading raw data is allowed; we block commands that mention the
#       protected folder AND look like writes. Deliberately simple heuristic
#       for teaching — in practice, combine with filesystem permissions or a
#       read-only mount in the container.
# -----------------------------------------------------------------------------
if (ferramenta == "Bash") {
  comando <- parametros$command %||% ""
  padrao_escrita <- "(\\brm\\b|\\bmv\\b|\\bcp\\b|sed -i|\\btee\\b|>|write_csv|write\\.csv|file\\.remove|unlink)"
  if (grepl(pasta_protegida, comando, fixed = TRUE) &&
      grepl(padrao_escrita, comando, perl = TRUE)) {
    bloquear(paste0("comando de terminal que parece modificar ", pasta_protegida, ": `", comando, "`."))
  }
}

quit(status = 0)
