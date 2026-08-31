# Workshop Agentes: Inteligência Artificial e Autonomia na Pesquisa Social

Repositório oficial de materiais, ementa, apresentações e tutoriais práticos do minicurso oferecido no **Seminário Discente DCP-USP 2026**.

## Ministrantes
* **Manoel Galdino** ([@mgaldino](https://github.com/mgaldino)) — Professor no Departamento de Ciência Política da USP
* **Felipe Lamarca** ([@felipelmc](https://github.com/felipelmc)) — Mestrando em Ciência Política no IESP-UERJ
* **Tales Mançano** ([@mancano-tales](https://github.com/mancano-tales)) — Mestrando em Ciência Política no DCP-USP

---

## Estrutura do Minicurso (2 Sessões de 1h30)

| Sessão | Tema Principal | Tópicos Centrais |
|---|---|---|
| **Sessão 1** | Do Chatbot ao Agente | LLMs como agentes (terminal, arquivos), panorama de modelos, prosa vs. instruções determinísticas, containerização — sem prática |
| **Sessão 2** | Habilidades Práticas | Hooks de agente (*code as policy*, analogia com git hooks — sem exigir git prévio), skills e orquestração/gerenciamento de contexto, MCP, `AGENTS.md`, boas aplicações exemplares de IA para pesquisa |

---

## Documentos e Materiais

* **Ementa Completa**: Consulte a versão em código em [2026-workshop-agentes-dcp-usp-ementa.qmd](2026-workshop-agentes-dcp-usp-ementa.qmd), a versão compilada em PDF em [docs/2026-workshop-agentes-dcp-usp-ementa.pdf](docs/2026-workshop-agentes-dcp-usp-ementa.pdf) ou em DOCX em [docs/2026-workshop-agentes-dcp-usp-ementa.docx](docs/2026-workshop-agentes-dcp-usp-ementa.docx).
* **Slides e Roteiros**:
  * [Sessão 1: Introdução e Ecossistema](aulas/01-introducao-ecossistema/)
  * [Sessão 2: Habilidades Práticas e Laboratório](aulas/02-habilidades-praticas/)

---

## Como Compilar os Materiais Localmente

Este projeto utiliza [Quarto](https://quarto.org) para renderização de documentos e apresentações:

```bash
# Renderiza a ementa para PDF (via Typst) e DOCX de uma vez
quarto render 2026-workshop-agentes-dcp-usp-ementa.qmd
```

O nome dos arquivos de saída (`docs/2026-workshop-agentes-dcp-usp-ementa.{pdf,docx}`) segue automaticamente o nome do arquivo fonte — não é preciso passar `--to` ou `--output`.
