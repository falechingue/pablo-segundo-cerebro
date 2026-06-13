# Pendencias.md

Tarefas e itens críticos.

## Críticas

- Finalizar Honcho/Roncho: plugin instalado, mas está desabilitado porque o slot de memória está em `memory-core`; precisa escolher Honcho gerenciado com API key ou self-host local antes de trocar o backend de memória.
- Definir política LGPD para radar de mercado em grupos.
- Validar primeira execução real dos crons `pablo-autocorrecao-segura-diaria` e `pablo-daily-notes-sync`.

## Importantes

- Preencher catálogo de produtos em `memory/produtos.md`.
- Confirmar fuso operacional do negócio.
- Definir canais autorizados: Telegram, WhatsApp, outros.
- Acompanhar se o loop de autocorreção diário gera ruído.
- Acompanhar se o cron `pablo-daily-notes-sync` consolida sem duplicar dados.
- Manter commits/pushes do segundo cérebro no repositório privado `falechingue/pablo-segundo-cerebro`.
- Monitorar custo/qualidade do Gbrain em modo `conservative` com OpenAI `text-embedding-3-small`.

## Em espera

- Supabase para alto volume.
- Gbrain skillpacks extras.
- Integrações Meta Ads, SEO, DataforSEO, Canva/Figma.
