#!/bin/bash

BACKUP_DIR="./backup"
DOTFILES=(
    "$HOME/.bashrc"
    "$HOME/.tmux.conf"

    # NVIM
    "$HOME/.config/nvim/init.vim"
    "$HOME/.config/nvim/init.lua"
    "$HOME/.config/nvim/coc-settings.json"

    # "$HOME/.zshrc"
    "$HOME/.gitconfig"
)

# Exige confirmação
confirm() {
    while true; do
        read -rp "Deseja sobrescrever $1? (y/n): " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Não entendi. Responda y (sim) ou n (não).";;
        esac
    done
}

# Restaura
for FILE in "${DOTFILES[@]}"; do
    BACKUP_FILE="$BACKUP_DIR/$(basename $FILE)" # Caminho absoluto
    FILE_NAME=$(basename "$FILE") # Só no nome do arquivo
    if [ -f "$BACKUP_FILE" ]; then
        if [ -f "$FILE" ]; then
            if confirm "$FILE_NAME"; then
                cp "$BACKUP_FILE" "$FILE"
                echo "Arquivo $FILE_NAME restaurado."
            else
                echo "Arquivo $FILE_NAME não foi sobrescrito."
            fi
        else
            cp "$BACKUP_FILE" "$FILE"
            echo "Arquivo $FILE_NAME restaurado."
        fi
    else
        echo "Backup de $FILE_NAME não encontrado em $BACKUP_DIR..."
    fi
done

echo "Fim do programa."
