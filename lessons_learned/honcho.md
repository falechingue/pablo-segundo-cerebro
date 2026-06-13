# Honcho/Roncho

## Objetivo

Usar Honcho/Roncho para memória persistente de personalidade, preferências e informações cross-session.

## Nome

Na transcrição aparece "Roncho". A ferramenta pública/documentada para OpenClaw é **Honcho**. Manter `Honcho/Roncho` nos documentos para não perder a referência do operador.

## Estado atual

- Plugin instalado: `@honcho-ai/openclaw-honcho`.
- Gateway ainda não foi reiniciado nesta conversa.
- `openclaw honcho` ainda não está disponível até o gateway carregar o plugin.
- `HONCHO_API_KEY` não está disponível na shell.

## Procedimento pendente

Após janela segura de reinício:

```bash
openclaw gateway restart
openclaw honcho setup
openclaw honcho status
```

Se usar self-host:

```text
API key: vazio
Base URL: http://localhost:8000
```

Se usar Honcho gerenciado:

```text
API key: chave fornecida por Pablo
Base URL: https://api.honcho.dev
```

## Validação esperada

```bash
openclaw honcho ask "o que você sabe sobre o tom preferido do Pablo?"
openclaw honcho search "Pablo quer agente versátil"
```

Resultado esperado: Honcho deve recuperar preferências de Pablo e traços do agente sem expor dados sensíveis.

## Regra

Não tratar Honcho como ativo até setup + status + teste de pergunta funcionarem.
