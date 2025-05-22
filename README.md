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
├── init.vim
├── nvim
│   ├── init.lua
│   ├── lazy-lock.json
│   ├── lua
│   ├── .luarc.json
│   ├── nvim
│   ├── README.md
│   └── Session.vim
├── .tmux.conf          " Configurações básicas do TMUX
├── tmux.service
└── .vimrc              " Configutações básicas do VIM puro
```

---

# Configurações a Serem Feitas Após Clonar o Repositório
## TMUX

* Instalação: `sudo apt install tmux`

Permanencia das sessões após desligar o PC:
```sh
systemctl --user enable tmux
systemctl --user start tmux
```

TODO: backup dos diretórios com os plugins!

---

# TODO
- [x] Script para restaurar dotfiles, podendo escolher quais devem ser sobrescritas.
- [x] Suporte a diretórios.
- [ ] No script de restauração, mostrar uma tela usando o `diff` entre a versão atual do arquivo e a versão do backup.
