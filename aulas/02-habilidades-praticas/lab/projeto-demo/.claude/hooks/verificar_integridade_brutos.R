# =============================================================================
# verificar_integridade_brutos.R  — hook PostToolUse (Bash) e Stop
#
# PT: Segunda camada de proteção dos dados brutos. O hook proteger_dados_brutos.R
#     é uma barreira ANTES da ação, mas só enxerga o texto do comando: um script
#     (ex.: Rscript limpar.R) pode alterar dados/brutos sem que o caminho apareça.
#     Este hook é um SENSOR: depois de cada comando de terminal, e antes de o
#     agente encerrar, compara o MD5 de cada arquivo de dados/brutos/ com a
#     referência versionada em dados/brutos.md5. Qualquer diferença, seja qual
#     for o programa que a causou, devolve um alerta ao agente (exit 2) e o
#     impede de encerrar até que os dados sejam restaurados.
#     O sensor não desfaz a alteração: avisa e trava. A restauração é feita a
#     partir do controle de versão (git checkout -- dados/brutos).
#
# EN: Second layer protecting the raw data. After every shell command and
#     before the agent stops, compares the MD5 of every file in dados/brutos/
#     with the versioned reference in dados/brutos.md5. Any difference, whatever
#     program caused it, is reported back (exit 2) and blocks stopping until
#     the data are restored. It does not undo the change; it alerts and blocks.
# =============================================================================

`%||%` <- function(x, y) if (is.null(x)) y else x

entrada <- jsonlite::fromJSON(
  paste(readLines(file("stdin"), warn = FALSE), collapse = "\n"),
  simplifyVector = FALSE
)

raiz <- Sys.getenv("CLAUDE_PROJECT_DIR", unset = getwd())
setwd(raiz)

referencia <- "dados/brutos.md5"
if (!file.exists(referencia)) {
  message("ALERTA: a referência ", referencia, " não existe; a integridade dos dados brutos não pode ser verificada.")
  quit(status = 2)
}

# PT: cada linha da referência tem "md5  caminho", no formato do md5sum.
# EN: each reference line is "md5  path", as written by md5sum.
linhas <- readLines(referencia, warn = FALSE)
linhas <- linhas[nzchar(trimws(linhas))]
esperado <- setNames(sub("^([0-9a-f]{32}).*$", "\\1", linhas),
                     sub("^[0-9a-f]{32}[[:space:]]+\\*?", "", linhas))

atuais <- list.files("dados/brutos", recursive = TRUE, full.names = TRUE)
obtido <- setNames(unname(tools::md5sum(atuais)), atuais)

problemas <- c(
  paste0("alterado: ", names(esperado)[names(esperado) %in% names(obtido) &
                                         esperado != obtido[names(esperado)]]),
  paste0("apagado: ", setdiff(names(esperado), names(obtido))),
  paste0("novo arquivo: ", setdiff(names(obtido), names(esperado)))
)
problemas <- problemas[!grepl(": $", problemas)]

if (length(problemas) == 0) quit(status = 0)

message(
  "ALERTA do hook verificar_integridade_brutos.R: os dados brutos não batem com a ",
  "referência em ", referencia, ".\n",
  paste0("- ", problemas, collapse = "\n"), "\n",
  "Pare o que estiver fazendo, restaure os dados com `git checkout -- dados/brutos` ",
  "e explique ao pesquisador o que aconteceu. Os dados brutos são somente leitura (ver AGENTS.md)."
)
quit(status = 2)
