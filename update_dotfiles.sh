#!/bin/bash

BACKUP_DIR="./backup"

# Lista de dotfiles para backup
DOTFILES=(
    # BASH
    "$HOME/.bashrc"

    # TMUX
    "$HOME/.tmux.conf"
    "$HOME/.config/systemd/user/tmux.service"

    # "$HOME/.zshrc"

    # GIT
    "$HOME/.gitconfig"

		# VIM puro
    "$HOME/.vimrc"
)

# Lista de diretórios para backup
DIRECTORIES=(
    # NVIM
    "$HOME/.config/nvim"

    # TMUX (plugins)
    "$HOME/.tmux"

    # Outros...
    # "$HOME/..."
)

# Cria o diretório de backup, se não existir
mkdir -p "$BACKUP_DIR"

# Faz o backup dos arquivos individuais
echo "Iniciando backup dos dotfiles..."
for FILE in "${DOTFILES[@]}"; do
    if [ -f "$FILE" ]; then
        echo -n "Salvando $FILE... " 
        cp "$FILE" "$BACKUP_DIR"
        echo "Sucesso!"
    else
        echo "Não encontrado: $FILE..."
    fi
done

# Faz o backup dos diretórios
echo -e "\nIniciando backup dos diretórios..."
for DIR in "${DIRECTORIES[@]}"; do
    if [ -d "$DIR" ]; then
        DIR_NAME=$(basename "$DIR")
        echo -n "Salvando o diretório $DIR... "
        # cp -r "$DIR" "$BACKUP_DIR/"
	rsync -v --exclude='.git' "$DIR" "$BACKUP_DIR/"
        echo "Sucesso!"
    else
        echo "Diretório não encontrado: $DIR..."
    fi
done

# Commita as mudanças
echo -n -e "\nRealizando commit... "

if [ ! -d ".git" ]; then
    git init
fi

git add .
git commit -m "Backup de dotfiles e diretórios em $(date +'%Y-%m-%d %H:%M:%S')"

echo "Sucesso!"
echo "Fim do programa."
