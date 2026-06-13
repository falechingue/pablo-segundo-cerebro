# Gbrain

## Objetivo

Usar Gbrain como camada de retrieval do segundo cérebro, evitando carregar arquivos grandes no contexto.

## Provedor de embeddings recomendado

Para a estrutura atual, o caminho mais simples é:

1. **OpenAI `text-embedding-3-small`** se Pablo quiser alinhar com a memória nativa do OpenClaw, que já tenta usar OpenAI.
2. **ZeroEntropy `zembed-1`** se Pablo quiser seguir a recomendação atual do Gbrain para custo/performance.

Decisão prática atual: aguardar uma chave válida antes de fixar. O ambiente não possui `OPENAI_API_KEY`, `ZEROENTROPY_API_KEY` nem `VOYAGE_API_KEY` válidos na shell, e a chave OpenAI configurada no OpenClaw retorna 401.

## Estado atual

- `bun` instalado.
- `gbrain` instalado.
- Brain local PGLite criado.
- Workspace sincronizado na fonte `espiao` após limpeza do GitHub.
- `retrieval-reflex` instalado.
- `gbrain search` retorna resultados textuais para termos como `Pablo` e `GitHub`.
- Embeddings ainda estão desativados (`Embedded: 0`).

## Procedimento executado

```bash
npm install -g bun
bun install -g github:garrytan/gbrain
gbrain init --pglite --no-embedding
gbrain sources add espiao --path /root/espiao
gbrain import /root/espiao --no-embed
gbrain integrations install retrieval-reflex --target /root/espiao
gbrain doctor --fast
gbrain sync --source espiao --no-embed
```

## Validação feita

```bash
gbrain stats
gbrain search "Pablo"
gbrain search "GitHub"
```

Resultado em 2026-06-13: `stats` mostra páginas/chunks e `search` retorna resultados textuais. Considerar Gbrain utilizável para busca textual local, mas ainda não para busca semântica/híbrida.

## Próximo procedimento

Quando houver chave válida:

```bash
export OPENAI_API_KEY="..."
gbrain config set embedding_model openai:text-embedding-3-small
gbrain embed --all
gbrain search "Pablo"
```

Ou, com ZeroEntropy:

```bash
export ZEROENTROPY_API_KEY="..."
gbrain config set embedding_model zeroentropyai:zembed-1
gbrain embed --all
gbrain search "Pablo"
```

## Regra

Pode usar Gbrain para busca textual validada. Não depender de Gbrain para recuperação semântica/híbrida até `gbrain embed --all` funcionar com uma chave válida.
