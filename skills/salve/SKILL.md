---
name: salve
description: "Fechar sessão propagando contexto para daily notes, pessoas, projetos, pendências, memória e Git."
triggers:
  - salve
  - /salve
  - "@pablo salve"
  - salva isso
  - registra isso
  - fecha a sessão
---

# Salve

Use ao final de sessão, quando Pablo pedir para salvar, ou quando houver decisão/pessoa/projeto/pendência relevante.

## O que faz

Categoriza o que aconteceu e injeta nos arquivos certos do segundo cérebro. O GitHub é a ideia de fonte da verdade; por enquanto, se não houver remoto configurado, preparar commit local/sugestão sem push.

## Workflow

1. Revisar a sessão atual.
2. Separar em categorias:
   - decisão;
   - pendência;
   - pessoa;
   - projeto;
   - demanda/oportunidade;
   - aprendizado recorrente;
   - contexto quente;
   - risco/alerta.
3. Ler o arquivo de destino antes de editar.
4. Fazer append ou atualização mínima.
5. Atualizar `daily_notes/YYYY-MM-DD.md`.
6. Consolidar quando fizer sentido:
   - `People.md`
   - `Projects.md`
   - `Pendencias.md`
   - `MEMORY.md`
   - `memory/hot.md`
   - `lessons_learned/`
7. Se Git estiver configurado:
   - mostrar arquivos alterados;
   - sugerir mensagem de commit;
   - só fazer push se autorizado/configurado.

## Destinos

- Daily note: `daily_notes/YYYY-MM-DD.md`
- Pessoas: `People.md` e `memory/people.md`
- Projetos: `Projects.md` e `memory/projects/`
- Pendências: `Pendencias.md` e `memory/pendencias.md`
- Decisões: `memory/decisoes/{YYYY-MM}.md`
- Demandas: `memory/demandas.md`
- Produtos: `memory/produtos.md`
- Contexto vivo: `memory/hot.md`
- Aprendizados: `lessons_learned/`

## Regras

- Nunca sobrescrever histórico sem necessidade.
- Nunca salvar mensagem privada literal quando paráfrase resolve.
- Nunca registrar dado pessoal sensível sem autorização.
- Não jogar conversa bruta no GitHub; salvar síntese.
- Não commitar/pushar se houver segredo ou arquivo suspeito.
