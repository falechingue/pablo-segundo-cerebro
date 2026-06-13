# index.md — Segundo cérebro

Este é o índice humano do segundo cérebro do agente Pablo Rodrigues.

## Arquivos centrais

| Arquivo | Função |
|---|---|
| `mapa.md` | Mapa operacional do workspace e ponto de partida |
| `MAPA.md` | Mapa legado/compatível com Starter Kit |
| `MEMORY.md` | Memória longa curada |
| `People.md` | Pessoas importantes e contexto relevante |
| `Projects.md` | Projetos, status e próximos passos |
| `Pendencias.md` | Tarefas críticas e pendências |
| `SOUL.md` | Personalidade e comportamento do agente |
| `AGENTS.md` | Regras de operação e limites |
| `USER.md` | Contexto de Pablo e Daiene |

## Pastas

| Pasta | Uso |
|---|---|
| `daily_notes/` | Notas diárias; entrada bruta organizada por dia |
| `lessons_learned/` | Aprendizados recorrentes e soluções reutilizáveis |
| `memory/` | Memória operacional categorizada |
| `intel/` | Radar de mercado, demandas e relatórios internos |
| `skills/` | Skills disponíveis |
| `automation/` | Rotinas simples de verificação e consolidação |
| `references/` | Transcrições e materiais de referência |
| `inbox/` | Entrada temporária antes da triagem |
| `starter-kit/` | Cópia integral do Starter Kit OpenClaw |

## Fluxo de memória

1. Acontecimento entra em `daily_notes/YYYY-MM-DD.md`.
2. No fechamento do dia, a rotina de consolidação lê a daily note.
3. O que for pessoa vai para `People.md`.
4. O que for projeto vai para `Projects.md`.
5. O que for tarefa vai para `Pendencias.md`.
6. O que for aprendizado recorrente vai para `lessons_learned/`.
7. O que for memória permanente vai para `MEMORY.md`.

## Rotinas ativas

- `pablo-autocorrecao-segura-diaria`: 08:30 Europe/Berlin.
- `pablo-daily-notes-sync`: 21:30 Europe/Berlin.

Ambas rodam em sessão isolada e não fazem push para GitHub.

## Organização de novas memórias

- Fato do dia: `daily_notes/`.
- Decisão durável: `MEMORY.md` e `memory/decisoes/`.
- Pessoa: `People.md`.
- Projeto: `Projects.md`.
- Tarefa: `Pendencias.md`.
- Aprendizado reutilizável: `lessons_learned/`.
- Demanda de mercado: `memory/demandas.md` e `intel/`.
- Material bruto: `references/` ou `inbox/`.

## Princípio

Não carregar tudo no contexto. Usar mapa, índice, busca e arquivos pequenos.
