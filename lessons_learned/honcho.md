# Honcho/Roncho

## Objetivo

Usar Honcho/Roncho para memória persistente de personalidade, preferências e informações cross-session.

## Nome

Na transcrição aparece "Roncho". A ferramenta pública/documentada para OpenClaw é **Honcho**. Manter `Honcho/Roncho` nos documentos para não perder a referência do operador.

## Estado atual

- Plugin instalado: `@honcho-ai/openclaw-honcho`.
- Plugin aparece instalado, mas desabilitado por conflito de slot: `memory slot set to "memory-core"`.
- `openclaw honcho` ainda não está disponível enquanto o plugin não for o backend de memória ativo.
- `HONCHO_API_KEY` não está disponível na shell.

## Procedimento pendente

Antes de trocar o backend de memória, escolher uma opção:

1. Honcho gerenciado: fornecer `HONCHO_API_KEY` e usar `https://api.honcho.dev`.
2. Honcho self-host: instalar/subir servidor local e usar `http://localhost:8000`.

Depois:

```bash
openclaw plugins enable openclaw-honcho
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

Não tratar Honcho como ativo até plugin ficar habilitado, backend configurado, gateway reiniciado, `status` OK e teste de pergunta funcionando. Como ele substitui `memory-core`, fazer troca com cautela.
