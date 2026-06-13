---
name: relatorio
description: "Gerar relatório executivo de radar de mercado, demandas, leads, projetos e próximos passos."
triggers:
  - relatorio
  - /relatorio
  - "@pablo relatorio"
  - relatório de demandas
  - relatório do grupo
  - resumo executivo
---

# Relatório

Use quando Pablo pedir relatório geral, relatório de grupo, demandas, leads, projetos ou radar de mercado.

## Tipos

- `relatorio geral` — visão executiva do período.
- `relatorio demandas` — demandas quentes e oportunidades.
- `relatorio leads` — pessoas com interesse, usando minimização de dados.
- `relatorio grupo` — análise de um arquivo em `intel/`.
- `relatorio projetos` — status de `Projects.md`.
- `relatorio pendencias` — itens críticos de `Pendencias.md`.

## Fontes

1. `memory/hot.md`
2. `Projects.md`
3. `Pendencias.md`
4. `People.md`
5. `memory/demandas.md`
6. `memory/produtos.md`
7. `memory/decisoes/{YYYY-MM}.md`
8. `daily_notes/`
9. `intel/`, somente quando relevante e autorizado
10. Gbrain/memory search, quando disponível

## Estrutura do relatório geral

```text
RELATÓRIO EXECUTIVO — Pablo Rodrigues
Período:
Gerado em:

1. RESUMO EXECUTIVO
- Principais sinais:
- Demandas quentes:
- Projetos afetados:
- Riscos:

2. DEMANDAS QUENTES
DEMANDA:
ORIGEM:
FREQUÊNCIA:
PRODUTO/MATERIAL RELACIONADO:
RECOMENDAÇÃO:

3. RADAR DE MERCADO
SINAL:
INTERPRETAÇÃO:
IMPLICAÇÃO:
PRÓXIMO PASSO:

4. PESSOAS/LEADS
PESSOA:
CONTEXTO:
INTERESSE:
NÍVEL:
PRÓXIMO PASSO:

5. PROJETOS E PENDÊNCIAS
PROJETO:
STATUS:
BLOQUEIO:
PRÓXIMA AÇÃO:

6. RECOMENDAÇÕES PARA PABLO E DAIENE
1.
2.
3.
```

## Regras

- Usar "radar de mercado", "observação ativa" ou "inteligência interna", não "espionagem".
- Focar em padrões e sinais, não fofoca.
- Não usar nome completo se primeiro nome/apelido bastar.
- Ligar demanda a produto quando houver produto cadastrado.
- Se não houver produto, marcar como oportunidade.
- Se os dados forem insuficientes, dizer claramente.
