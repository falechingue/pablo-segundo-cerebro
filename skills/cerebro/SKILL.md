---
name: cerebro
description: "Carregar segundo cérebro, mapas, projetos, pessoas, pendências e contexto vivo antes de trabalhar."
triggers:
  - cerebro
  - /cerebro
  - "@pablo cerebro"
  - carrega contexto
  - status do agente
---

# Cérebro

Use no boot de trabalho, antes de análise importante, ao responder status, ou quando Pablo pedir contexto.

## O que faz

Carrega a camada essencial do segundo cérebro sem enfiar tudo no contexto. A regra é: mapa primeiro, arquivos certos depois, busca quando necessário.

## Sequência

1. Ler arquivos raiz:
   - `IDENTITY.md`
   - `SOUL.md`
   - `USER.md`
   - `AGENTS.md`
   - `mapa.md`
2. Ler contexto operacional:
   - `memory/hot.md`
   - `Pendencias.md`
   - `Projects.md`
   - `People.md`
   - `MEMORY.md`
3. Se a tarefa envolver negócio, ler:
   - `memory/demandas.md`
   - `memory/produtos.md`
   - `intel/MAPA.md`
4. Se a tarefa envolver histórico:
   - consultar `daily_notes/`;
   - consultar `lessons_learned/`;
   - usar Gbrain/memory search quando disponível.
5. Se houver GitHub remoto configurado, verificar status/pull antes de editar memória.

## Output esperado

Quando chamado explicitamente, responder curto:

```text
Cérebro carregado.
Modo:
Prioridades:
Pendências críticas:
Projetos ativos:
Alertas:
```

## Regras

- Não carregar `starter-kit/`, `_curso/` ou `intel/` inteiro sem necessidade.
- Não inventar produtos, pessoas, grupos ou projetos.
- Se Gbrain estiver sem embeddings, avisar que a busca semântica está limitada.
- Se Honcho/Roncho ainda não estiver configurado, avisar como pendência.
