# NEWS.md — 2026-workshop-agentes-dcp-usp

## 2026-08-24 — Renomeação da Ementa e Correção do Pipeline de Renderização

- `ementa.qmd` renomeado para `2026-workshop-agentes-dcp-usp-ementa.qmd`. A chave `output-file` do YAML de formato não é respeitada por esta instalação do Quarto (1.9.37) em nenhum formato testado (`typst`, `pdf`, `docx`); como o Quarto nomeia a saída a partir do nome do arquivo de entrada, renomear o arquivo fonte foi a forma robusta de garantir que `docs/2026-workshop-agentes-dcp-usp-ementa.{pdf,docx}` sejam gerados sem flags manuais.
- Removido o formato `pdf` (LaTeX) duplicado do YAML — `typst` já produz o PDF; ter os dois formatos causava colisão de nome de arquivo intermediário ao rodar `quarto render` sem `--to`.
- Formato `typst`/`docx` movido para `_quarto.yml` (nível de projeto) para que `quarto render <arquivo>.qmd` sem flags gere PDF e DOCX de uma vez.
- Corrigido `date:` do YAML de `"24 de agosto de 2026"` (texto livre) para `"2026-08-24"` (ISO), que estava sendo renderizado como "Invalid Date" no PDF/DOCX.
- Atualizadas as referências ao nome do arquivo em `README.md` e `aulas/01-introducao-ecossistema/notas-aula.md`.

**Metadados de Execução**:
- **Data/Hora**: 2026-08-24 (Horário de Brasília)
- **Agente**: Claude Code (Sonnet 5)
- **Arquivos afetados**: ementa.qmd → 2026-workshop-agentes-dcp-usp-ementa.qmd, _quarto.yml, README.md, aulas/01-introducao-ecossistema/notas-aula.md

## 2026-08-24 — Correção de Arquivos de Governança Corrompidos

- `CLAUDE.md` e `AGENTS.md` continham resíduo bruto de um heredoc PowerShell (vazado do script de inicialização), deixando ambos ilegíveis a partir da metade do arquivo desde o commit inicial. Conteúdo reescrito com as diretrizes de operação originalmente pretendidas.
- Corrigido bug cosmético em `README.md`: a cerca de código do bloco `bash` estava malformada (caractere de backspace residual quebrando a cerca de três crases).

**Metadados de Execução**:
- **Data/Hora**: 2026-08-24 (Horário de Brasília)
- **Agente**: Claude Code (Sonnet 5)
- **Arquivos afetados**: CLAUDE.md, AGENTS.md, README.md

## 2026-08-24 19:54 — Inicialização do Repositório do Minicurso

- Criação da estrutura de governança, pastas de aulas e configuração do Quarto.
- Redação da ementa oficial (\ementa.qmd\) para compilação em PDF acadêmico.
- Configuração do corpo docente: Manoel Galdino (DCP-USP), Felipe Lamarca (IESP-UERJ) e Tales Mançano (DCP-USP).

**Metadados de Execução**:
- **Data/Hora**: 2026-08-24 19:54 (Horário de Brasília)
- **Agente**: Gemini 3.7 Flash / Antigravity / Windows
- **Mensagem do Commit**: "feat: inicializar repositorio do workshop de agentes dcp-usp 2026"
- **Arquivos afetados**: .gitignore, _quarto.yml, ementa.qmd, README.md, CLAUDE.md, NEWS.md
