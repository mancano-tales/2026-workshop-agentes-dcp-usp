# NEWS.md — 2026-workshop-agentes-dcp-usp

<!-- NEWS-FRAGMENTS:BEGIN -->
<!-- NEWS-FRAGMENTS:END -->

## 2026-09-26 — CLAUDE.md vira ponteiro para o AGENTS.md

Decisão do autor (plano `repo-governance/plan/2026-09-26_Plano_AGENTS_Enxutos_e_Export_Sob_Demanda.md` do `mancano-repo-hub` (issue #27 de lá)). O `CLAUDE.md` era uma cópia do `AGENTS.md` e agora contém só `@AGENTS.md`. O conteúdo é o mesmo; mudava só o título.

**Metadados de Execução**:
- **Data**: 2026-09-26
- **Agente**: Claude Code / Claude Opus 5.5 / Claude Code on the web
- **Mensagem do Commit**: "docs(agents): AGENTS.md unico e enxuto; CLAUDE.md vira @AGENTS.md"
- **Arquivos afetados**: `CLAUDE.md`, `NEWS.md`

## 2026-08-30 23:14 — Ajuste da Ementa por Feedback de Galdino e Lamarca (Sessão 2)

Incorporado feedback recebido em 2026-08-30 sobre a Sessão 2, antes da submissão ao edital do XVI Seminário Discente (prazo 2026-08-31):

- **Item 2 (Hooks)**: explicitado que a analogia com *git hooks* é apenas conceitual — não exige conhecimento prévio de Git dos participantes — e que a demonstração de *code as policy* é feita ao vivo pelos ministrantes, não como exercício prático dos participantes. Atende ao apontamento do Galdino de que não haveria tempo (carga horária de 3h) para ensinar git durante o minicurso.
- **Item 1 (Skills)** e **Item 5 (Aplicações Exemplares)**: adicionada menção a gerenciamento de contexto — separar agente de implementação de agente de validação — como exemplo concreto de orquestração e como boa prática recorrente nas aplicações exemplares, atendendo à sugestão da segunda mensagem de feedback.
- `README.md`: tabela da Sessão 2 atualizada para refletir a mesma mudança de enquadramento.
- PDF e DOCX recompilados via Quarto.

**Metadados de Execução**:
- **Data/Hora**: 2026-08-30 23:14 (Horário de Brasília)
- **Agente**: Claude Sonnet 5 / Claude Code / Windows
- **Arquivos afetados**: 2026-workshop-agentes-dcp-usp-ementa.qmd, README.md, NEWS.md, docs/2026-workshop-agentes-dcp-usp-ementa.pdf, docs/2026-workshop-agentes-dcp-usp-ementa.docx

## 2026-08-25 — Reestruturação do Programa (Sessões 1 e 2)

- Sessão 1: adicionados os itens "Panorama de Modelos e Ferramentas" (famílias de modelos, agentes de terminal/editor) e "Benefícios, Vantagens e Custos" (quando vale automatizar, modelos de cobrança) — fechando lacuna apontada pelo autor entre o programa e o que a sessão deveria cobrir (o que é, o que existe, benefícios, preços).
- Sessão 2: renomeada para "Habilidades Práticas e Governança"; reestruturada em 5 itens (Skills, Hooks, MCP/Segurança, `AGENTS.md`/Reprodutibilidade, Software Exemplar), incorporando uma proposta do autor sem descartar `AGENTS.md` (ligado ao Objetivo 4) nem a lista de ferramentas exemplares (Zotero/Beaver, Whisper, Taguette) já revisada. Conceitos mais avançados da proposta original (orquestração de subagentes) viraram nota opcional, para não conflitar com o público-alvo sem experiência prévia em programação (§3).

**Metadados de Execução**:
- **Data/Hora**: 2026-08-25 (Horário de Brasília)
- **Agente**: Claude Code (Sonnet 5)
- **Arquivos afetados**: 2026-workshop-agentes-dcp-usp-ementa.qmd, NEWS.md

## 2026-08-25 — Revisão de Prosa da Ementa

- Corrigidos erros de concordância, digitação e coerência introduzidos em edições manuais da ementa (Seção 1, Objetivos, Sessão 1 e Sessão 2): concordância verbal em "o uso...tiveram" (§1), "vanajosa"→"vantajosa" e regência em "tarefas...em que" (Objetivo 1), "Intodução"→"Introdução" (título da Sessão 1), negrito Markdown quebrado e referência solta ("a mesma ideia") no item 1 da Sessão 2.
- Renomeado o subitem 1 da Sessão 1 de "Introdução aos Agentes" (duplicava o título da própria sessão) para "LLMs como Agentes".
- Mantida a citação nominal a Zotero + Beaver no item de software com IA (decisão revertida, a pedido do autor, em relação à abstração adotada em `5fcba03`/`ff3e9d7`) e adicionada uma linha de alternativas open-source (Whisper, Taguette).
- Adicionada quebra de linha final ausente no arquivo.

**Metadados de Execução**:
- **Data/Hora**: 2026-08-25 (Horário de Brasília)
- **Agente**: Claude Code (Sonnet 5)
- **Arquivos afetados**: 2026-workshop-agentes-dcp-usp-ementa.qmd, NEWS.md

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
