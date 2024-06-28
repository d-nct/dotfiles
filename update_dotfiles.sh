#!/bin/bash

BACKUP_DIR="./backup"
DOTFILES=(
    "$HOME/.bashrc"
    "$HOME/.zshrc"
    "$HOME/.gitconfig"
    "$HOME/.tmux.conf"
    "$HOME/.config/nvim/init.vim"
    "$HOME/.config/nvim/init.lua"
    "$HOME/.config/nvim/coc-settings.json"
)

mkdir -p "$BACKUP_DIR"

# Faz o backup arquivo por arquivo
for FILE in "${DOTFILES[@]}"; do
    if [ -f "$FILE" ]; then
        echo -n "Salvando $FILE... " 
        cp "$FILE" "$BACKUP_DIR"
        echo "Sucesso!"
    else
        echo "Não encontrado: $FILE..."
    fi
done

# Commita as mudanças
echo -n "Realizando commit... "
cd "$BACKUP_DIR" || exit

if [ ! -d ".git" ]; then
    git init
fi

git add .
git commit -m "Backup de dotfiles em $(date +'%Y-%m-%d %H:%M:%S')"

echo "Sucesso!"
echo "Fim do programa."
