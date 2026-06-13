# Honcho/Roncho

## Objetivo

Usar Honcho/Roncho para memória persistente de personalidade, preferências e informações cross-session.

## Nome

Na transcrição aparece "Roncho". A ferramenta pública/documentada para OpenClaw é **Honcho**. Manter `Honcho/Roncho` nos documentos para não perder a referência do operador.

## Estado atual

- Decisão de 2026-06-13: não usar Honcho gerenciado por custo.
- Plugin `@honcho-ai/openclaw-honcho` foi desinstalado com `openclaw plugins uninstall openclaw-honcho --force`.
- Não havia base local `~/.honcho` para apagar.
- O backend de memória segue sem Honcho.

## Alternativa adotada

- GitHub guarda o segundo cérebro limpo e versionado.
- Gbrain PGLite local faz busca semântica com OpenAI `text-embedding-3-small`.
- `memory-core` do OpenClaw pode ser reavaliado depois, mas a indexação vetorial falhou com 429 `insufficient_quota` no momento.

## Se retomar no futuro

Só reabrir Honcho se uma destas condições existir:

1. Pablo aprovar custo do Honcho gerenciado e fornecer `HONCHO_API_KEY`.
2. Pablo autorizar self-host local e aceitar manutenção do servidor.

## Regra

Não reinstalar nem ativar Honcho/Roncho sem autorização explícita. Como ele substitui o backend de memória, qualquer retorno deve ter backup, validação e limite de custo.
