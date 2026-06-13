# Daily notes sync

## Objetivo

Usar `daily_notes/` como entrada diária e consolidar o que importa em:

- `People.md`
- `Projects.md`
- `Pendencias.md`
- `memory/hot.md`
- `memory/decisoes/{YYYY-MM}.md`
- `lessons_learned/`
- `MEMORY.md`

## Rotina

Um cron diário roda em sessão isolada e pede ao agente para:

1. Ler a daily note do dia.
2. Separar pessoas, projetos, pendências e aprendizados.
3. Atualizar `memory/hot.md` com o que precisa estar vivo no próximo boot.
4. Registrar decisões importantes em `MEMORY.md` e `memory/decisoes/{YYYY-MM}.md`.
5. Atualizar apenas arquivos necessários.
6. Não duplicar itens existentes.

## Regras

- Parafrasear.
- Não copiar conversas brutas.
- Não adicionar dados pessoais sensíveis.
- Se não houver daily note, registrar apenas que não havia material.
- Não fazer push automático; informar arquivos modificados e deixar commit/push para uma ação explícita ou rotina separada.
