# GitHub do segundo cérebro

## Estado atual

Em 2026-06-13 foi investigada autenticação GitHub para criar o repositório remoto privado do segundo cérebro.

Resultado:

- `gh` CLI não está instalado.
- SSH para `git@github.com` respondeu `Permission denied (publickey)`.
- `GITHUB_TOKEN` e `GH_TOKEN` não existem no ambiente.
- O repositório local `/root/espiao` não tem remote configurado.

Conclusão: ainda não existe autenticação GitHub válida disponível para criar o remoto ou fazer push inicial.

## O que falta escolher

Existem três caminhos simples:

1. GitHub CLI com login interativo.
2. SSH key cadastrada na conta GitHub.
3. PAT/token via variável de ambiente, com cuidado para não salvar token em arquivo do repo.

## Caminho recomendado: GitHub CLI

Instalar e autenticar:

```bash
sudo apt-get update
sudo apt-get install -y gh
gh auth login
```

Depois de autenticado:

```bash
cd /root/espiao
gh repo create pablo-segundo-cerebro --private --source=. --remote=origin --push
```

## Alternativa: SSH

Criar chave:

```bash
ssh-keygen -t ed25519 -C "pablo-segundo-cerebro"
cat ~/.ssh/id_ed25519.pub
```

Adicionar a chave pública no GitHub e validar:

```bash
ssh -T git@github.com
```

Criar repo privado manualmente no GitHub e conectar:

```bash
cd /root/espiao
git remote add origin git@github.com:SEU_USUARIO/pablo-segundo-cerebro.git
git push -u origin master
```

## Alternativa: PAT

Exportar token somente na sessão atual:

```bash
export GH_TOKEN="cole_o_token_aqui"
gh repo create pablo-segundo-cerebro --private --source=/root/espiao --remote=origin --push
```

Não salvar o token em `.env`, Markdown ou histórico do repositório.

## Próxima ação automática

Quando houver autenticação válida, a próxima rodada deve:

1. confirmar `gh auth status` ou `ssh -T git@github.com`;
2. criar remoto privado;
3. conectar `origin`;
4. executar push inicial;
5. atualizar este arquivo com URL do remoto, método usado e data.

