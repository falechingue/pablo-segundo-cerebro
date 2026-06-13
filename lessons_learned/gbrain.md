# Gbrain

## Objetivo

Usar Gbrain como camada de retrieval do segundo cérebro, evitando carregar arquivos grandes no contexto.

## Provedor de embeddings recomendado

Para a estrutura atual, o caminho mais simples é:

1. **OpenAI `text-embedding-3-small`** se Pablo quiser alinhar com a memória nativa do OpenClaw, que já tenta usar OpenAI.
2. **ZeroEntropy `zembed-1`** se Pablo quiser seguir a recomendação atual do Gbrain para custo/performance.

Decisão prática atual: usar OpenAI `text-embedding-3-small`, reaproveitando chave OpenAI já configurada localmente no OpenClaw, sem expor o segredo em logs.

## Estado atual

- `bun` instalado.
- `gbrain` instalado.
- Brain local PGLite criado.
- Workspace sincronizado na fonte `espiao` após limpeza do GitHub.
- `retrieval-reflex` instalado.
- `gbrain search` retorna resultados textuais para termos como `Pablo` e `GitHub`.
- Embeddings ativos com OpenAI `text-embedding-3-small`.
- Última validação: 34 páginas, 52 chunks, 52 embeddings.
- Busca semântica/híbrida validada com `gbrain query ... --no-expand`.

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
gbrain reinit-pglite --embedding-model openai:text-embedding-3-small --embedding-dimensions 1536 --yes
gbrain config set search.mode conservative
gbrain sync --source espiao
```

Observação operacional: em 2026-06-13, o `reinit-pglite` recriou o banco, mas deixou `embedding_disabled: true` no `~/.gbrain/config.json`. Foi necessário ajustar o config local para:

```json
{
  "embedding_disabled": false,
  "embedding_model": "openai:text-embedding-3-small",
  "embedding_dimensions": 1536
}
```

## Validação feita

```bash
gbrain stats
gbrain search "Pablo"
gbrain search "GitHub"
gbrain query "qual e o papel do Git no segundo cerebro?" --no-expand
```

Resultado em 2026-06-13: `stats` mostra `Embedded: 52`, `search` retorna resultados textuais e `query --no-expand` retorna resultados ranqueados por relevância. Considerar Gbrain utilizável para busca textual e semântica local.

## Próximo procedimento

- Manter `search.mode` em `conservative` enquanto o volume de uso for baixo e sensível a custo.
- Se mudar provedor/dimensão em PGLite, usar `gbrain reinit-pglite`, não `gbrain config set embedding_model`, porque o schema vetorial precisa ser recriado.
- Antes de confiar em automação, rodar `gbrain doctor --fast`, `gbrain stats` e uma consulta `gbrain query`.

## Regra

Pode usar Gbrain para busca textual e semântica validada. Não instalar skillpacks extras do Gbrain sem autorização explícita do operador.
