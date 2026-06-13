# MEMORY.md

Memória longa curada do agente Pablo Rodrigues.

## Flags de instalação

- starter_core_installed: true (2026-06-13)
- bootstrap_removed: true (2026-06-13)
- maps_installed: true (2026-06-13)
- local_skills_installed: true (2026-06-13) — cerebro, salve, relatorio
- full_starter_kit_installed: true (2026-06-13)
- bruno_immersion_layer_started: true (2026-06-13)
- gbrain_installed_local: true (2026-06-13) — PGLite, sem embeddings por falta de chave
- honcho_plugin_installed: true (2026-06-13) — setup/restart pendente
- gbrain_workspace_imported: partial (2026-06-13) — 184 páginas no banco, mas busca ainda não retorna resultados
- gbrain_retrieval_reflex_installed: true (2026-06-13)
- autocorrection_cron_enabled: true (2026-06-13) — diário 08:30 Europe/Berlin
- daily_notes_sync_cron_enabled: true (2026-06-13) — diário 21:30 Europe/Berlin
- automations_enabled: false
- external_integrations_enabled: false
- market_radar_enabled: planned

## Decisões importantes

- 2026-06-13: Pablo pediu para instalar o starter kit usando também o pacote menor de segundo cérebro, mas sem implementar tudo de uma vez.
- 2026-06-13: A instalação deve priorizar cautela, privacidade, explicação do que foi feito e lista do que ficou de fora.
- 2026-06-13: Linguagem e operação de "espionagem" não devem virar automação real sem revisão ética e LGPD.
- 2026-06-13: Pablo autorizou colocar o pacote completo do Starter Kit OpenClaw; foi copiado integralmente e as skills foram migradas, mas automações externas permaneceram desligadas.
- 2026-06-13: Antes da camada da imersão Bruno/Gbrain/Honcho, foi criado backup em `/root/espiao-backups/espiao-starterkit-base-20260613-025240.tar.gz`.
- 2026-06-13: Pablo quer que o agente seja versátil/volátil, capaz de falar de qualquer assunto e aprender outros domínios com o tempo, sem ficar preso só a contabilidade/BPO.
- 2026-06-13: "Modo espião" deve virar "radar de mercado" ou nome menos invasivo, mantendo funcionalidade quando autorizada.
- 2026-06-13: Cron de autocorreção segura criado com job id `e1a6c5ec-1b65-42e4-97db-f6fe26346d82`.
- 2026-06-13: Gbrain não deve ser tratado como retrieval confiável até configurar embeddings/corrigir busca.
- 2026-06-13: Não há chave válida disponível para finalizar Gbrain/Honcho; OpenClaw memory retornou OpenAI 401 com chave mascarada.
- 2026-06-13: Cron `pablo-daily-notes-sync` criado com job id `31d391ff-31b6-47d0-8285-64da09dce545`.

## Fatos estáveis

- O agente apoia Pablo e Daiene em contabilidade, BPO financeiro, organização, relatórios e inteligência de mercado.
- O agente deve aprender e operar em outros assuntos conforme projetos e memórias forem criados.
- O tom preferido é direto, prático e sem enrolação.
- Pablo quer avançar por incrementos, validando cada camada antes de ativar automações.

## Próximas decisões

- Confirmar fuso operacional do negócio.
- Definir regras de privacidade para radar de mercado em grupos.
- Criar GitHub privado remoto para o segundo cérebro e conectar outras IAs.
- Preencher produtos/materiais reais em `memory/produtos.md`.
- Definir canais externos autorizados.
- Configurar chave de embeddings do Gbrain.
- Finalizar Honcho/Roncho com API key ou self-host.
