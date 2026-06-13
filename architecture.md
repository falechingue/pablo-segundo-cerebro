# architecture.md — Arquitetura do agente Pablo Rodrigues

Documento de visão geral para manutenção do workspace. A filosofia é a da imersão do Bruno: mapa primeiro, contexto sob demanda, pouca automação e nada de over engineering.

## Visão geral

O workspace `/root/espiao` é o segundo cérebro local do agente Pablo Rodrigues.

Ele combina:

- arquivos raiz de identidade e operação;
- memória categorizada em Markdown;
- daily notes como entrada diária;
- skills para carregar, salvar e reportar contexto;
- Git local como histórico;
- Gbrain instalado para retrieval, ainda sem embeddings funcionais;
- Honcho/Roncho instalado como plugin, ainda pendente de setup após janela segura de reinício.

## Arquivos centrais

| Arquivo | Papel |
|---|---|
| `SOUL.md` | Tom, limites, modo de atuação e filosofia do agente |
| `IDENTITY.md` | Identidade operacional |
| `USER.md` | Preferências e contexto de Pablo/Daiene |
| `AGENTS.md` | Regras operacionais e red lines |
| `mapa.md` | Mapa principal, no padrão sugerido pela imersão |
| `MAPA.md` | Mapa legado/compatível com o Starter Kit |
| `index.md` | Índice humano do segundo cérebro |
| `MEMORY.md` | Memória longa curada |
| `People.md` | Pessoas importantes |
| `Projects.md` | Projetos, status e próximos passos |
| `Pendencias.md` | Itens críticos e tarefas abertas |

## Pastas

| Pasta | Conteúdo |
|---|---|
| `daily_notes/` | Notas diárias; fonte primária de consolidação |
| `memory/` | Memória operacional fatiada por categoria |
| `lessons_learned/` | Aprendizados recorrentes e procedimentos já testados |
| `skills/` | Skills vivas usadas pelo agente |
| `intel/` | Radar de mercado, modelos de relatório e grupo |
| `references/` | Transcrições e materiais brutos de referência |
| `automation/` | Scripts e logs de rotinas simples |
| `starter-kit/` | Cópia integral do pacote original para referência |
| `_curso/`, `templates/`, `archive/`, `exemplos/` | Material promovido do Starter Kit |
| `content/`, `inbox/`, `projects/` | Áreas de trabalho ainda pouco usadas |

## Fluxo de memória

1. A conversa, aula, auditoria ou acontecimento entra em `daily_notes/YYYY-MM-DD.md`.
2. A rotina de consolidação lê a daily note.
3. Pessoas relevantes vão para `People.md` e, quando necessário, `memory/people.md`.
4. Projetos vão para `Projects.md` e podem ganhar pasta própria depois.
5. Tarefas e bloqueios vão para `Pendencias.md` e `memory/pendencias.md`.
6. Aprendizados reaproveitáveis vão para `lessons_learned/`.
7. Decisões duráveis vão para `MEMORY.md` e `memory/decisoes/YYYY-MM.md`.

## Skills principais

| Skill | Uso |
|---|---|
| `cerebro` | Carregar mapa e contexto essencial |
| `salve` | Fechar sessão e sugerir propagação de memória |
| `relatorio` | Gerar síntese executiva e radar |
| `retrieval-reflex` | Preferir busca/retrieval antes de abrir texto grande |

As demais skills estão categorizadas em `skills/index.md`.

## Crons existentes

| Cron | Agenda | Função |
|---|---|---|
| `pablo-autocorrecao-segura-diaria` | 08:30 Europe/Berlin | Verificação segura de logs, Git, skills, Gbrain e arquivos essenciais |
| `pablo-daily-notes-sync` | 21:30 Europe/Berlin | Consolidar daily notes em pessoas, projetos, pendências e aprendizados |

Ambos rodam em sessão isolada e anunciam resultado no Telegram configurado. Nenhum reinício foi feito nesta auditoria.

## Componentes instalados

| Componente | Estado |
|---|---|
| OpenClaw Gateway | Rodando em `127.0.0.1:18789` |
| Telegram | Configurado no OpenClaw |
| Git local | Inicializado com histórico |
| Gbrain | Instalado em `/root/.bun/bin/gbrain`, banco PGLite com páginas importadas |
| Honcho/Roncho | Plugin `@honcho-ai/openclaw-honcho` instalado e habilitado, CLI pendente de reload/setup |
| Codex plugin | Habilitado |
| Memory Core | Habilitado, mas embeddings indisponíveis por chave OpenAI inválida |

## Dependências

- Node/OpenClaw `2026.6.5`
- Bun para executar Gbrain
- Git local
- OpenAI OAuth configurado no OpenClaw
- Chave OpenAI API antiga ainda presente em auth do Codex; config geral foi ajustado para priorizar OAuth, mas embeddings agora falham por quota 429
- GitHub CLI ausente
- SSH GitHub sem chave aceita

## Pendências abertas

- Resolver quota/billing OpenAI ou definir provider alternativo de embeddings.
- Reautenticar OpenAI/Codex ou remover/substituir com segurança a API key antiga que termina em `RpoA`.
- Validar embeddings do Memory Core depois da reautenticação.
- Decidir se Gbrain usará OpenAI, ZeroEntropy ou outro provedor.
- Fazer `gbrain import` com embeddings e confirmar `gbrain search` com resultados reais.
- Reiniciar gateway em janela segura para carregar `openclaw honcho`.
- Executar `openclaw honcho setup` quando houver API key/ambiente definido.
- Instalar/autenticar GitHub CLI ou configurar SSH/PAT para criar remoto privado.
- Reduzir duplicidade de indexação entre `starter-kit/` e arquivos promovidos.
