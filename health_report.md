# health_report.md — Auditoria de saúde

Data: 2026-06-13

## Resumo executivo

O segundo cérebro está estruturado e utilizável como base Markdown/Git local. A principal falha operacional é a camada de embeddings: tanto o Memory Core quanto o Gbrain ainda não fazem busca semântica real. O erro original 401 foi localizado e contornado no config geral; a validação posterior passou a falhar por quota OpenAI 429.

Não foram instaladas novas ferramentas, não foram criados agentes e nenhum serviço foi reiniciado nesta rodada.

## Estrutura e duplicidade

### Duplicidades encontradas

- `starter-kit/` contém uma cópia integral do kit original.
- O mesmo conteúdo foi promovido para a raiz e para `_curso/`, `skills/`, `templates/`, `archive/` e `exemplos/`.
- Existem pares exatos como `CHANGELOG.md` e `starter-kit/CHANGELOG.md`, `_curso/transcricao-completa.md` e `starter-kit/_curso/transcricao-completa.md`, várias skills em `skills/` e `starter-kit/skills/`.
- `mapa.md` e `MAPA.md` têm funções parecidas. `mapa.md` é o mapa principal no padrão da imersão; `MAPA.md` fica como compatibilidade do Starter Kit.
- `People.md` e `memory/people.md`, `Pendencias.md` e `memory/pendencias.md` também têm sobreposição de função.

### Pastas pouco usadas

- `content/`
- `inbox/`
- `projects/`
- `memory/projects/`

Elas não precisam ser apagadas agora. São úteis como lugares futuros, mas não devem virar fonte principal enquanto estiverem vazias.

### Complexidade desnecessária

- Indexar `starter-kit/` junto com o conteúdo promovido duplica ruído no Gbrain.
- Manter logs automáticos versionados tende a poluir Git.
- Muitos arquivos do curso são referência, não memória operacional. Eles devem ser buscados sob demanda, não carregados no contexto.

### Simplificação aplicada

- `.gitignore` passou a ignorar novos logs em `automation/logs/*.log`.
- A ordem geral de auth OpenAI em `~/.openclaw/openclaw.json` foi ajustada para tentar OAuth antes de `openai:api-key`.

Não apaguei nem movi arquivos nesta rodada.

## Status do Gbrain

- Binário existe em `/root/.bun/bin/gbrain`.
- `gbrain` não aparece no shell padrão sem adicionar `/root/.bun/bin` ao `PATH`.
- O gateway também reporta que o service PATH não inclui `/root/.bun/bin`.
- Banco PGLite contém 183 páginas e 1176 chunks.
- Embeddings: 0.
- `gbrain search "Pablo segundo cérebro"` retorna `No results`.

Diagnóstico: Gbrain está instalado e importou páginas, mas ainda não está funcional como busca semântica.

Recomendação: corrigir provider/chave de embeddings antes de reimportar. Não rodar novas instalações.

## Status do Honcho/Roncho

- Plugin `@honcho-ai/openclaw-honcho` aparece instalado e habilitado.
- `openclaw honcho` ainda não está disponível na CLI atual.
- Motivo provável: gateway precisa ser reiniciado em janela segura para carregar o comando/plugin.
- Nenhum setup foi executado nesta rodada.

Recomendação: na próxima janela segura, reiniciar gateway, rodar `openclaw honcho setup` e validar memória de personalidade.

## Status dos crons

Crons ativos:

- `pablo-autocorrecao-segura-diaria`
  - Agenda: 08:30 Europe/Berlin.
  - Status: idle.
  - Entrega: Telegram.
- `pablo-daily-notes-sync`
  - Agenda: 21:30 Europe/Berlin.
  - Status: idle.
  - Entrega: Telegram.

Nenhum cron novo foi criado.

## Status do Git

- Git local existe.
- Branch atual: `master`.
- Últimos commits:
  - `b16fe1a docs: indexar segundo cerebro e rotinas de memoria`
  - `73f61de docs: registrar pendencia de busca gbrain`
  - `dc8cd82 init: segundo cerebro pablo com starter kit e camada bruno`
- Não havia remote configurado no início da auditoria.

## Status dos backups

Backup confirmado:

- `/root/espiao-backups/espiao-starterkit-base-20260613-025240.tar.gz`
- `/root/espiao-backups/espiao-starterkit-base-20260613-025240.tar.gz.sha256`

Backup adicional de configuração antes do ajuste de auth:

- `/root/.openclaw/openclaw.json.backup-before-auth-order-*`

## API keys OpenAI, erro 401 e quota 429

Erro reproduzido:

- `openclaw memory status --index --agent espiao`
- Falha inicial: OpenAI embeddings 401.
- Chave envolvida: `sk-proj-8fvW...RpoA` (mascarada).

Componentes que usam ou referenciam chaves OpenAI:

- `~/.openclaw/agents/espiao/agent/codex-home/auth.json`
  - `auth_mode: apikey`
  - `OPENAI_API_KEY: sk-proj-8fvW...RpoA`
  - Esta é a chave que bate com o erro 401.
- `~/.openclaw/agents/espiao/agent/plugins/openai/catalog.json`
  - catálogo OpenAI gerado para o agente `espiao`;
  - também referencia a chave terminando em `RpoA`.
- `~/.openclaw/openclaw.json`
  - tem `auth.order.openai`;
  - foi ajustado para priorizar OAuth antes de API key.
- `~/.openclaw/openclaw.json`
  - skill `openai-whisper-api` tem outra chave mascarada, `sk-proj-Pp79...7-YA`;
  - não é a chave exibida no erro de embeddings.
- arquivos de starter/evals têm exemplos fictícios como `sk-proj-xxx...`, `sk-proj-OLD...` e não devem ser tratados como credenciais reais.

Correção aplicada:

- `auth.order.openai` agora prioriza `openai:julia@financasazul.com.br` antes de `openai:api-key`.
- Após esse ajuste, a indexação deixou de retornar 401 e passou a retornar 429 `insufficient_quota`.

Correção pendente:

- Resolver quota/billing do provedor OpenAI usado para embeddings ou escolher outro provedor compatível.
- Reautenticar/remover com segurança a chave antiga em `~/.openclaw/agents/espiao/agent/codex-home/auth.json` em janela controlada.
- Não substituí a chave porque não existe valor válido disponível e eu não vou inventar credencial.

## GitHub remoto

Autenticações verificadas:

- `gh`: não instalado.
- SSH GitHub: `Permission denied (publickey)`.
- `GITHUB_TOKEN`/`GH_TOKEN`: ausentes no ambiente.
- Remote Git: ausente.

Resultado: não existe autenticação GitHub válida no momento. Não criei repositório remoto.

## Problemas conhecidos

- OpenAI embeddings deixaram de falhar por 401 no config geral, mas agora falham por 429 `insufficient_quota`.
- Gbrain sem embeddings e sem resultados reais.
- `gbrain` fora do PATH padrão do serviço.
- Honcho CLI indisponível até reinício/reload seguro.
- GitHub remoto privado ainda não criado por falta de autenticação.
- `starter-kit/` duplica conteúdo já promovido e pode sujar retrieval.

## Recomendações

1. Resolver quota/billing OpenAI ou escolher provedor alternativo de embeddings antes de insistir em Gbrain/Memory Core.
2. Depois, reindexar Gbrain com embeddings reais e validar busca.
3. Em janela segura, reiniciar gateway e finalizar Honcho.
4. Configurar GitHub com `gh` ou SSH e fazer push privado.
5. Manter `starter-kit/` como referência arquivada e evitar indexar essa pasta junto com o conteúdo ativo.
6. Não apagar pastas vazias agora; apenas não usar como fonte principal até haver necessidade real.
