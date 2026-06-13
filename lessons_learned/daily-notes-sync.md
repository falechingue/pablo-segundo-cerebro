# Daily notes sync

## Objetivo

Usar `daily_notes/` como entrada diária e consolidar o que importa em:

- `People.md`
- `Projects.md`
- `Pendencias.md`
- `lessons_learned/`
- `MEMORY.md`

## Rotina

Um cron diário roda em sessão isolada e pede ao agente para:

1. Ler a daily note do dia.
2. Separar pessoas, projetos, pendências e aprendizados.
3. Atualizar apenas arquivos necessários.
4. Não duplicar itens existentes.
5. Registrar decisões importantes em `MEMORY.md`.

## Regras

- Parafrasear.
- Não copiar conversas brutas.
- Não adicionar dados pessoais sensíveis.
- Se não houver daily note, registrar apenas que não havia material.
