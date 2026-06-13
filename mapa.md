# mapa.md — Segundo cérebro do Pablo Rodrigues

> Mapa raiz em formato pedido na imersão do Bruno Okamoto. Use este arquivo como ponto de partida antes de carregar contexto grande.

## Projetos existentes

| Projeto | Status | Onde fica |
|---|---|---|
| Instalação Starter Kit OpenClaw | instalado | `starter-kit/`, `skills/`, `templates/`, `_curso/` |
| Segundo cérebro Pablo | em estruturação | `MEMORY.md`, `memory/`, `People.md`, `Projects.md`, `Pendencias.md` |
| Radar de mercado contábil/BPO | planejado | `intel/`, `memory/demandas.md`, `skills/relatorio/` |
| Gbrain retrieval | instalado parcialmente | local PGLite em `~/.gbrain`; workspace importado; embeddings pendentes |
| Gbrain retrieval-reflex | instalado | `skills/retrieval-reflex/` |
| Honcho/Roncho memória persistente | plugin instalado | setup/restart pendente |
| Git segundo cérebro | local existente | este workspace Git; remoto GitHub pendente |
| Autocorreção segura | ativo | cron diário OpenClaw + `automation/scripts/autocorrecao-loop.sh` |

## Localização das skills

| Categoria | Caminho | Função |
|---|---|---|
| Segundo cérebro | `skills/cerebro`, `skills/salve`, `skills/relatorio` | carregar, salvar e reportar contexto |
| Starter Kit | `skills/starter/` | wizards de onboarding e jornada |
| Operacional | `skills/operacional/` | backup, commit, cron, segurança |
| Planejamento | `skills/planejamento/` | brainstorm, plano, execução, verificação |
| Canais | `skills/canais/` | WhatsApp e canais externos |

## Categorias de ferramentas

- Memória local: `MEMORY.md`, `memory/`, `daily_notes/`, `lessons_learned/`
- Retrieval: Gbrain, `memory_search`, `memory_get`
- Personalidade persistente: Honcho/Roncho, `SOUL.md`, `IDENTITY.md`
- Versionamento: Git local agora; GitHub remoto depois
- Operação: skills em `skills/operacional/`
- Pesquisa/relatório: `skills/relatorio/`, `intel/`
- Autocorreção: `automation/`, cron `pablo-autocorrecao-segura-diaria`

## Estrutura do segundo cérebro

```
workspace/
├── mapa.md                 → este mapa raiz
├── People.md               → pessoas importantes
├── Projects.md             → projetos e próximos passos
├── Pendencias.md           → tarefas e itens críticos
├── MEMORY.md               → memória longa curada
├── daily_notes/            → notas diárias
├── lessons_learned/        → aprendizados recorrentes
├── memory/                 → memória operacional categorizada
├── intel/                  → radar de mercado e relatórios internos
├── skills/                 → habilidades
├── references/             → materiais de referência, incluindo transcrições
├── automation/             → scripts e logs de autocorreção segura
└── starter-kit/            → pacote completo original
```

## Conteúdo de cada pasta

- `daily_notes/`: acontecimentos diários; fonte para consolidar `People`, `Projects`, `Pendencias` e `MEMORY`.
- `lessons_learned/`: soluções recorrentes e padrões que o agente deve reaproveitar.
- `memory/`: arquivos vivos por categoria, usados pelas skills.
- `intel/`: observação ativa/radar de mercado, templates de grupos e relatórios.
- `skills/`: workflows reutilizáveis.
- `references/`: transcrições, aulas e materiais brutos.
- `automation/`: loop de verificação seguro, sem ação destrutiva.
- `inbox/`: entrada bruta temporária para triagem antes de consolidar.

## Como usar

1. Carregar `mapa.md`.
2. Ler só os arquivos necessários.
3. Se precisar buscar contexto amplo, usar Gbrain/memory search.
4. Ao final, rodar `/salve` para categorizar aprendizados.
