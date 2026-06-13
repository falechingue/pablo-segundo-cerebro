# architecture.md — Arquitetura do agente Pablo Rodrigues

Data de alinhamento: 2026-06-13

Este documento descreve a arquitetura atual após comparação com a transcrição da imersão interna do Bruno Okamoto de 11/06/2026, os exemplos da Amora e os templates do Starter Kit.

## Norte filosófico

A arquitetura segue quatro ideias da imersão:

1. O segundo cérebro é uma base textual no GitHub, não um banco mágico.
2. `Cérebro` carrega contexto essencial; `Salve` e daily notes consolidam depois.
3. A memória não precisa ser atualizada em tempo real.
4. O melhor sistema é o que funciona e segue em frente, sem over engineering.

## Visão geral

O workspace `/root/espiao` é o segundo cérebro local do agente Pablo Rodrigues, com remoto privado no GitHub:

`https://github.com/falechingue/pablo-segundo-cerebro`

Ele combina:

- arquivos raiz de identidade, operação e navegação;
- memória categorizada em Markdown;
- daily notes como entrada diária;
- skills de contexto, fechamento e relatório;
- Git/GitHub como histórico e portabilidade;
- referências da imersão e do Starter Kit;
- automações simples, já existentes, mantidas sob cautela.

## Arquivos centrais

| Arquivo | Papel |
|---|---|
| `SOUL.md` | Tom, limites, modos e filosofia do agente |
| `IDENTITY.md` | Identidade operacional |
| `USER.md` | Preferências e contexto de Pablo/Daiene |
| `AGENTS.md` | Boot sequence, red lines e regras de comportamento |
| `mapa.md` | Mapa operacional curto inspirado na imersão |
| `MAPA.md` | Mapa central compatível com Starter Kit |
| `index.md` | Índice humano do segundo cérebro |
| `MEMORY.md` | Memória longa curada |
| `People.md` | Pessoas importantes |
| `Projects.md` | Projetos, status e próximos passos |
| `Pendencias.md` | Itens críticos e tarefas abertas |

## Pastas

| Pasta | Conteúdo | Estado |
|---|---|---|
| `daily_notes/` | Notas diárias e fatos do dia | ativa |
| `memory/` | Memória operacional fatiada por categoria | ativa |
| `lessons_learned/` | Aprendizados recorrentes | ativa |
| `skills/` | Skills vivas usadas pelo agente | ativa |
| `content/` | Rascunhos e artefatos criados | disponível |
| `intel/` | Radar de mercado autorizado | planejada/limitada |
| `references/` | Transcrições e materiais brutos | ativa |
| `templates/` | Templates do Starter Kit | referência |
| `exemplos/` | Exemplos do Starter Kit/Amora | referência |
| `archive/` | Material antigo preservado | ativa |
| `automation/` | Scripts e logs de rotinas simples | ativa com cautela |
| `starter-kit/` | Cópia integral do pacote original | referência |
| `_curso/` | Material didático promovido do kit | referência |
| `inbox/`, `projects/` | Áreas reservadas para uso futuro | pouco usadas |

## Fluxo de memória

1. A conversa, aula, auditoria ou acontecimento entra em `daily_notes/YYYY-MM-DD.md`.
2. `salve` ou a rotina de consolidação lê a daily note.
3. Pessoas relevantes vão para `People.md` e, quando necessário, `memory/people.md`.
4. Projetos vão para `Projects.md` ou `memory/projects/`.
5. Tarefas e bloqueios vão para `Pendencias.md` e `memory/pendencias.md`.
6. Aprendizados reaproveitáveis vão para `lessons_learned/`.
7. Decisões duráveis vão para `MEMORY.md` e `memory/decisoes/YYYY-MM.md`.
8. Git registra a evolução; GitHub privado preserva e permite uso por outras ferramentas.

## Skills principais

| Skill | Uso |
|---|---|
| `cerebro` | Carregar mapa e contexto essencial |
| `salve` | Fechar sessão e propagar síntese para memória |
| `relatorio` | Gerar síntese executiva e radar |
| `retrieval-reflex` | Preferir busca/retrieval antes de abrir texto grande |
| `verification-before-completion` | Verificar evidências antes de declarar conclusão |

As demais ficam categorizadas em `skills/index.md` e registries locais.

## Rotinas existentes

| Rotina | Agenda | Estado | Observação |
|---|---|---|---|
| `pablo-autocorrecao-segura-diaria` | 08:30 Europe/Berlin | idle | Audita Git, skills, Gbrain e arquivos essenciais; ainda sem última execução registrada |
| `pablo-daily-notes-sync` | 21:30 Europe/Berlin | idle | Consolida daily notes; ainda sem última execução registrada |

Nenhum serviço foi reiniciado e nenhum cron novo foi criado nesta rodada.

## Componentes parciais

| Componente | Estado | Decisão |
|---|---|---|
| Gbrain | instalado/importado parcialmente, sem busca semântica confiável | manter como pendência; não depender dele |
| Honcho/Roncho | plugin instalado, setup/reload pendente | finalizar só em janela segura |
| Radar de mercado | estrutura preparada | ativar apenas com regra clara de privacidade |

## Complexidade aceita

- `starter-kit/` duplica material promovido, mas é mantido como referência original.
- `MAPA.md` e `mapa.md` coexistem para compatibilidade e praticidade.
- `automation/` existe porque os crons já foram criados; a recomendação é manter simples e auditar antes de expandir.
- `content/`, `inbox/`, `projects/` e `memory/projects/` ficam disponíveis, mas não devem virar fonte principal enquanto estiverem vazios.

## Critério de evolução

Criar novas pastas, skills, crons ou integrações só quando houver uso real. Se uma melhoria não reduz confusão, risco ou trabalho recorrente, fica como recomendação futura.
