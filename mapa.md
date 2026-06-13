# mapa.md — Segundo cérebro do Pablo Rodrigues

> Mapa operacional curto, no espírito da imersão do Bruno Okamoto em 11/06/2026: mapa primeiro, contexto sob demanda, GitHub como base textual e consolidação por daily notes.

## Ponto de partida

| Preciso de... | Ler primeiro |
|---|---|
| Identidade, tom e limites | `SOUL.md`, `IDENTITY.md`, `USER.md`, `AGENTS.md` |
| Visão geral do workspace | `MAPA.md`, este `mapa.md`, `index.md` |
| Contexto vivo e prioridades | `memory/hot.md`, `Projects.md`, `Pendencias.md` |
| Memória longa curada | `MEMORY.md`, `memory/decisoes/{YYYY-MM}.md` |
| Pessoas, projetos e pendências | `People.md`, `Projects.md`, `Pendencias.md` |
| Referência da imersão | `references/imersao-interna-11jun-pixel-ai-hub.md` |

## Estrutura do segundo cérebro

```text
workspace/
├── mapa.md                 → mapa operacional curto
├── MAPA.md                 → mapa central compatível com Starter Kit
├── index.md                → índice humano do segundo cérebro
├── architecture.md         → visão técnica e filosófica da arquitetura
├── health_report.md        → auditoria de saúde e alinhamento
├── MEMORY.md               → memória longa curada
├── People.md               → pessoas importantes, com minimização de dados
├── Projects.md             → projetos, status e próximos passos
├── Pendencias.md           → tarefas e itens críticos
├── daily_notes/            → notas diárias; fonte primária de consolidação
├── lessons_learned/        → aprendizados recorrentes
├── memory/                 → memória operacional por categoria
├── content/                → rascunhos e artefatos criados
├── intel/                  → radar de mercado autorizado
├── skills/                 → habilidades reutilizáveis
├── templates/              → templates do Starter Kit
├── exemplos/               → exemplos de referência, principalmente Amora
├── references/             → transcrições e materiais brutos
├── archive/                → material antigo preservado
├── automation/             → rotinas simples e logs
└── starter-kit/            → cópia integral do pacote original
```

## Fluxo de memória recomendado

1. Entrada relevante vai para `daily_notes/YYYY-MM-DD.md`.
2. Fechamento de sessão usa a skill `salve` quando Pablo pedir ou quando houver fato durável.
3. Consolidação separa o que vira pessoa, projeto, pendência, decisão, demanda ou aprendizado.
4. O que é memória viva vai para `memory/hot.md`.
5. O que é decisão durável vai para `MEMORY.md` e `memory/decisoes/`.
6. Git registra o histórico textual; GitHub privado é o remoto.

## Rotinas atuais

| Rotina | Estado | Observação |
|---|---|---|
| Git local | ativo | Branch `master` rastreando `origin/master` |
| GitHub privado | ativo | `https://github.com/falechingue/pablo-segundo-cerebro` |
| `pablo-autocorrecao-segura-diaria` | agendado | 08:30 Europe/Berlin; ainda sem execução registrada |
| `pablo-daily-notes-sync` | agendado | 21:30 Europe/Berlin; ainda sem execução registrada |
| Gbrain | parcial | páginas importadas, busca semântica não confiável sem embeddings |
| Honcho/Roncho | parcial | plugin instalado, setup/reload pendente em janela segura |

## Filosofia operacional

- Não carregar tudo no contexto.
- Não tentar atualizar memória em tempo real.
- Daily notes são a chuva acumulada; consolidação é feita depois, com critério.
- GitHub guarda texto, histórico e portabilidade entre ferramentas.
- Arquivos sensíveis ou conversas privadas devem virar síntese, não cópia bruta.
- Automação começa simples: audita e alerta antes de corrigir.
- O que já funciona não deve ser refeito só por perfeccionismo.

## O que fica propositalmente diferente dos exemplos

- Não há novos agentes de governança. A imersão cita Leonardo da Vinci como inspiração, mas Pablo pediu explicitamente para não criar agentes.
- Não há instalação nova de Gbrain/Roncho nesta rodada. O estado parcial foi preservado.
- `starter-kit/` permanece inteiro como referência, mesmo duplicando conteúdo promovido.
- `automation/` existe porque já havia crons criados, mas deve continuar simples e auditável.
- `mapa.md` e `MAPA.md` coexistem: `mapa.md` é operacional curto; `MAPA.md` mantém compatibilidade com o Starter Kit.

## Como usar

1. Leia este arquivo.
2. Abra só o arquivo necessário.
3. Use busca/retrieval apenas quando o mapa não bastar.
4. Ao final de uma sessão relevante, rode `salve` ou registre no daily note.
