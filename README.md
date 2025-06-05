# Objetivo
Repositório pessoal dos meus arquivos de configuração para facilitar eventuais migrações.

# Uso
Para dar permissão de execução aos scripts, é necessário executar uma vez o comando 
```sh
chmod +x update_dotfiles.sh restore_dotfiles.sh
```

## Realizar Backup
Basta executar 
```sh
./update_dotfiles.sh
```

## Restaurar Backup
Basta executar
```sh
./restore_dotfiles.sh
```

---

# Mapa de Arquivos Versionados

```bash
backup/
├── .bashrc             " Conifgurações do bash
├── .gitconfig          " Configurações do git
├── .tmux.conf          " Configurações básicas do TMUX
├── .tmux.tar.gz        " Diretório com plugins do TMUX
├── .vimrc              " Arquivo de config básico para VIM puro
├── FiraMonoNerdFontMono-Regular.otf   " Fonte com caracteres especiais
├── init.vim            " Dispensa comentários
├── nvim.tar.gz         " Diretório com plugins e configurações do NeoVIM
└── tmux.service
```

---

# Configurações Posteriores

## TMUX

* Instalação: `sudo apt install tmux`

Permanencia das sessões após desligar o PC:

```sh
systemctl --user enable tmux
systemctl --user start tmux
```

## NerdFont

Para reconhecer a fonte, é necessário recarregar o cache do sistema operacional:

```bash
fc-cache -fv
```

---

# TODO
- [x] Script para restaurar dotfiles, podendo escolher quais devem ser sobrescritas.
- [x] Suporte a diretórios.
- [ ] No script de restauração, mostrar uma tela usando o `diff` entre a versão atual do arquivo e a versão do backup.
