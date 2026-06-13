# MAPA — Workspace do Pablo Rodrigues

> Mapa central. Leia este arquivo para saber onde encontrar qualquer coisa.

## Como usar este mapa

Este é o mapa oficial do workspace. Um agente novo deve começar por aqui para entender a estrutura geral e ir direto ao arquivo ou pasta certa.

Também existe `mapa.md` nesta VPS, como resumo operacional curto para navegação rápida. Em acessos via GitHub, trate este `MAPA.md` como suficiente e oficial; se `mapa.md` estiver disponível localmente, use-o quando precisar de uma visão enxuta do fluxo de trabalho e volte para este `MAPA.md` quando precisar da lista completa de pastas, mapas locais e estado operacional.

Regra de navegação para agentes:

1. Leia `AGENTS.md` para regras e limites.
2. Leia este `MAPA.md` para descobrir onde está o que precisa.
3. Abra apenas os arquivos/pastas indicados na seção "Navegação rápida".
4. Ao entrar em uma pasta com `MAPA.md`, leia esse mapa local antes de explorar a pasta inteira.
5. Use busca (`rg`, Gbrain ou equivalente) só quando o mapa não apontar o caminho.

## Arquivos raiz

| Arquivo | Função | Quando ler |
|---|---|---|
| `IDENTITY.md` | Identidade do agente | Boot ou dúvida de identidade |
| `SOUL.md` | Personalidade, tom, limites e radar | Boot ou decisão de comportamento |
| `USER.md` | Sobre Pablo, Daiene e preferências | Boot ou personalização |
| `AGENTS.md` | Regras operacionais do workspace | Boot e ações sensíveis |
| `MAPA.md` | Este mapa central, compatível com Starter Kit | Navegação |
| `mapa.md` | Mapa operacional curto inspirado na imersão do Bruno | Início de trabalho |
| `index.md` | Índice humano do segundo cérebro | Navegação ampla |
| `architecture.md` | Arquitetura e filosofia do workspace | Auditoria e manutenção |
| `health_report.md` | Saúde, diferenças e recomendações | Auditoria |
| `HEARTBEAT.md` | Proatividade e checks periódicos | Quando configurar rotina |

## Pastas principais

```
workspace/
├── content/
│   ├── drafts/      → rascunhos criados pelo agente
│   └── archive/     → conteúdo finalizado ou antigo
├── daily_notes/      → notas diárias para consolidação posterior
├── lessons_learned/  → aprendizados recorrentes
├── memory/
│   ├── hot.md       → contexto vivo
│   ├── demandas.md  → demandas e oportunidades
│   ├── pendencias.md
│   ├── produtos.md
│   ├── people.md
│   ├── decisoes/
│   └── projects/
├── intel/
│   └── grupos e relatórios internos, quando autorizados
├── references/
│   └── transcrições e materiais brutos
├── automation/
│   └── rotinas simples de auditoria e logs
└── archive/
    └── arquivos antigos ou substituídos
```

## Mapas locais

| Pasta | Função | Mapa |
|---|---|---|
| `content/` | Rascunhos, relatórios e artefatos criados | `content/MAPA.md` |
| `memory/` | Memória curta, decisões, demandas e projetos | `memory/MAPA.md` |
| `skills/` | Skills locais instaladas | `skills/MAPA.md` |
| `intel/` | Inteligência de grupos e relatórios internos | `intel/MAPA.md` |
| `archive/` | Arquivos antigos e material substituído | `archive/MAPA.md` |
| `starter-kit/` | Cópia integral do pacote OpenClaw v2.5.7 | `starter-kit/README.md` |
| `_curso/` | Material didático do curso | `_curso/INDICE.md` |
| `templates/` | Templates originais do kit | `templates/README.md` |
| `exemplos/` | Exemplos do kit | `exemplos/README.md` |
| `daily_notes/` | Notas diárias usadas como fonte de consolidação | `daily_notes/MAPA.md` |
| `lessons_learned/` | Aprendizados recorrentes | `lessons_learned/MAPA.md` |
| `automation/` | Rotinas simples e logs | `automation/MAPA.md` |

## Navegação rápida

| Estou buscando... | Onde ir |
|---|---|
| Modo ativo e prioridades | `memory/hot.md` |
| Demandas detectadas | `memory/demandas.md` |
| Pendências abertas | `memory/pendencias.md` |
| Produtos e materiais | `memory/produtos.md` |
| Pessoas ou contatos relevantes | `memory/people.md` |
| Decisões do mês | `memory/decisoes/{YYYY-MM}.md` |
| Intel de grupos | `intel/` |
| Skills disponíveis | `skills/_registry.md` |
| Transcrição da imersão Bruno 11/06/2026 | `references/imersao-interna-11jun-pixel-ai-hub.md` |
| Relatório de saúde/alinhamento | `health_report.md` |

## Estado operacional

- GitHub privado ativo: `https://github.com/falechingue/pablo-segundo-cerebro`.
- Git local ativo: branch `master` rastreando `origin/master`.
- Fuso operacional: `America/Sao_Paulo` (horário de Brasília).
- Crons agendados: `pablo-autocorrecao-segura-diaria` e `pablo-daily-notes-sync`.
- Gbrain está ativo com OpenAI `text-embedding-3-small` em modo `conservative`; monitorar custo/qualidade.
- Honcho/Roncho foi removido; não usar serviço pago sem autorização explícita.
- Monitoramento/coleta real de grupos continua desativado até regra clara de privacidade.

---

*Criado na instalação inicial do Starter Kit OpenClaw v2.5.7. Atualizado em 2026-06-13 para alinhar com a imersão interna do Bruno e com o estado real de GitHub/crons.*
