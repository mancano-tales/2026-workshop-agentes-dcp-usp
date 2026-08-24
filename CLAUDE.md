# Workshop Agentes: Inteligência Artificial e Autonomia na Pesquisa Social

Repositório oficial de materiais, ementa, apresentações e tutoriais práticos do minicurso oferecido no **Seminário Discente DCP-USP 2026**.

## Ministrantes
* **Manoel Galdino** (Professor no Departamento de Ciência Política da USP)
* **Felipe Lamarca** (Mestrando em Ciência Política no IESP-UERJ)
* **Tales Mançano** (Mestrando em Ciência Política no DCP-USP)

---

## Estrutura do Minicurso (2 Sessões de 1h30)

| Sessão | Tema Principal | Tópicos Centrais |
|---|---|---|
| **Sessão 1** | Fundamentos, Harness e Ecossistema | Conceito de agente, harnesses, panorama de modelos LLM, custos de tokens e casos de uso em ciências sociais |
| **Sessão 2** | Habilidades Práticas e Governança | Hooks determinísticos, skills personalizadas, protocolos de ferramentas (MCP) e reprodutibilidade científica |

---

## Documentos e Materiais

* **Ementa Completa**: Consulte a versão em código em [\ementa.qmd\](ementa.qmd) ou a versão compilada em PDF em [\docs/ementa.pdf\](docs/ementa.pdf).
* **Slides e Roteiros**:
  * [Sessão 1: Introdução e Ecossistema](aulas/01-introducao-ecossistema/)
  * [Sessão 2: Habilidades Práticas e Laboratório](aulas/02-habilidades-praticas/)

---

## Como Compilar os Materiais Localmente

Este projeto utiliza [Quarto](https://quarto.org) para renderização de documentos e apresentações:

\\\ash
# Renderizar a ementa para PDF/Typst
quarto render ementa.qmd

# Renderizar todos os materiais do projeto
quarto render
\\\
"@ | Out-File -Encoding utf8 "C:\Users\Mancano\Documents\MancanoSync\2026-workshop-agentes-dcp-usp\README.md"

# 5. CLAUDE.md
@"
# CLAUDE.md — 2026-workshop-agentes-dcp-usp

## Visão Geral do Projeto
Repositório do minicurso "Workshop Agentes: Seminário Discente DCP-USP 2026", ministrado por Manoel Galdino (DCP-USP), Felipe Lamarca (IESP-UERJ) e Tales Mançano (DCP-USP).

## Ministrantes
1. Manoel Galdino (Professor, DCP-USP)
2. Felipe Lamarca (Mestrando, IESP-UERJ)
3. Tales Mançano (Mestrando, DCP-USP)

## Diretrizes de Operação para Agentes de IA
* **Comunicação Direta**: Manter tom conciso, profissional e acadêmico. Evitar uso de emojis.
* **Governança**: Toda alteração relevante no curso deve ser registrada no \NEWS.md\.
* **Renderização**: A ementa e slides utilizam Quarto. Não edite arquivos PDF/HTML compilados diretamente em \docs/\; edite os fontes \.qmd\ e execute a compilação.
