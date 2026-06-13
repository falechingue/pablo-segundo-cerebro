# Autocorreção segura

## Princípio

O loop de autocorreção só corrige automaticamente problemas seguros e reversíveis. Questões críticas viram alerta.

## Pode corrigir sozinho

- Atualizar mapas quando uma pasta nova foi criada.
- Registrar logs de verificação.
- Sugerir commit quando Git estiver limpo/configurado.
- Detectar arquivo esperado ausente e criar placeholder mínimo.

## Não corrige sozinho

- Segredos, tokens e permissões.
- Gateway/restart sem contexto.
- Crons em massa.
- Remoção de arquivos.
- Alteração de integrações externas.

## Saída esperada

Relatório com:

- status;
- correções feitas;
- alertas;
- próximos passos.
