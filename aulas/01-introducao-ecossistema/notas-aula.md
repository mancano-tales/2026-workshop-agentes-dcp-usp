# Sessão 1: Introdução aos Agentes de IA — Conceitos, Modelos e Ecossistema

Roteiro do instrutor para a primeira sessão expositiva (1h30). Formato: bloco por tópico, com cues de tempo, pontos de ênfase, exemplos para apoio da fala e perguntas de engajamento. Alinhado a [2026-workshop-agentes-dcp-usp-ementa.qmd](../../2026-workshop-agentes-dcp-usp-ementa.qmd), Seção 4.1. Sessão estritamente conceitual — nenhuma habilidade prática é ensinada aqui (fica para a Sessão 2).

**Distribuição de tempo (90 min):**

| Bloco | Duração | Conteúdo |
|---|---|---|
| Abertura | 5 min | Boas-vindas, objetivos de aprendizagem, expectativas |
| 1. Do Chatbot ao Agente Autônomo | 25 min | *(detalhado abaixo — amostra)* |
| 2. Panorama de Modelos e Infraestrutura | 20 min | A detalhar |
| 3. Vantagens, Benefícios e Casos de Uso nas Ciências Sociais | 20 min | A detalhar |
| 4. Economia de Tokens e Orçamento de Pesquisa | 15 min | A detalhar |
| Encerramento | 5 min | Ponte para a Sessão 2, perguntas finais |

---

## Bloco 1 — Do Chatbot ao Agente Autônomo (25 min)

**Objetivo do bloco:** a turma sai entendendo por que "agente" não é sinônimo de "chatbot mais esperto", e consegue nomear os três componentes que distinguem um agente.

### 1.1 Abertura do bloco (3 min) — gancho

Comece perguntando à turma, sem introduzir jargão ainda:

> "Quem aqui já usou um LLM para revisar um texto ou tirar uma dúvida pontual? E quem já pediu para um LLM *executar* uma tarefa de várias etapas sozinho — por exemplo, coletar dados de várias fontes, organizar numa planilha e sinalizar inconsistências, sem você intervir a cada passo?"

A resposta esperada é: quase todos levantam a mão na primeira pergunta, poucos na segunda. Esse gap é o tema do bloco.

**Ponto de ênfase:** não é sobre o modelo ser "mais inteligente". É sobre uma mudança de arquitetura — de uma interação síncrona e supervisionada para um *loop* de execução com autonomia delimitada.

### 1.2 Limitações do paradigma de chat convencional na pesquisa acadêmica (7 min)

Talking points:

- No modo chat, cada resposta depende de o pesquisador formular o próximo prompt. Isso funciona bem para tarefas de uma etapa (resumir, traduzir, explicar), mas degrada rapidamente em tarefas de pesquisa que exigem múltiplas etapas dependentes (coletar → limpar → codificar → validar).
- Cada nova mensagem "reseta" o compromisso do modelo com o plano original — não há memória de execução, só memória de conversa.
- Exemplo para a turma (ciências sociais): codificação temática de 200 entrevistas. No modo chat, o pesquisador cola um trecho, pede a codificação, copia o resultado, cola o próximo trecho — o humano é o *orquestrador* do loop. Com um agente, ele itera sobre o corpus sozinho, aplicando o mesmo protocolo de codificação, e só retorna ao pesquisador para validação de amostra ou quando encontra ambiguidade.

**Pergunta para a turma:** "Que tarefa da pesquisa de vocês hoje segue exatamente esse padrão — vocês fazendo manualmente o que poderia ser um loop?" (Colher 1–2 respostas, não precisa aprofundar — serve para ancorar o conceito seguinte.)

### 1.3 Componentes centrais de um agente (10 min)

Apresentar os três componentes como resposta à pergunta de abertura. Sugestão de sequência no quadro/slide:

1. **Raciocínio recursivo** — o modelo não produz uma resposta final de uma vez; ele avalia o estado atual da tarefa, decide o próximo passo, executa, observa o resultado e reavalia. É um ciclo, não uma chamada única.
2. **Memória** — distinguir memória de curto prazo (contexto da tarefa em andamento) de memória persistente (o que o agente deve reter entre sessões — ex: preferências do pesquisador, decisões metodológicas já tomadas).
3. **Planejamento e execução de ferramentas (*tool calling*)** — o agente não só "pensa em texto": ele pode invocar ferramentas externas (rodar código, consultar um banco de dados, buscar na web) e usar o resultado real dessas ferramentas para decidir o próximo passo.

**Ponto de ênfase:** a combinação desses três é o que separa um agente de um chatbot com prompt longo. Um chatbot "ajustado" para parecer autônomo, mas sem loop de execução real e sem tool calling verificável, não é um agente — é um chat mais verboso.

### 1.4 O conceito de *harness* (5 min)

- Definir *harness* como o ambiente que envolve o modelo e viabiliza o loop: onde o agente roda, quais permissões de leitura/escrita ele tem, que grau de isolamento existe (sandbox vs. acesso direto ao sistema de arquivos do pesquisador) e quem controla o fluxo (o agente decide sozinho quando parar, ou há pontos de checagem humana obrigatórios?).
- Gancho para a Sessão 2: aqui é onde entram hooks determinísticos e skills — mecanismos de controle sobre o harness, não sobre o modelo em si.

**Transição para o Bloco 2:** "Se um agente depende desse ambiente de execução, a próxima pergunta natural é: quais modelos existem hoje para colocar dentro desse harness, e como escolher entre eles?"

---

## Blocos 2–4 e Encerramento

*A detalhar após validação do formato acima com o restante da equipe.*
