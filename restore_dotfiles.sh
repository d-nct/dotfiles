#!/bin/bash

BACKUP_DIR="./backup"

# Lista de dotfiles para restaurar
DOTFILES=(
    # BASH
    "$HOME/.bashrc"

    # TMUX
    "$HOME/.tmux.conf"
    "$HOME/.config/systemd/user/tmux.service"

    # "$HOME/.zshrc"
    "$HOME/.gitconfig"
)

# Lista de diretórios para restaurar
DIRECTORIES=(
    # NVIM
    "$HOME/.config/nvim"
)

# Função para confirmar sobrescrita
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

# Restaura os arquivos individuais
echo "Iniciando restauração dos dotfiles..."
for FILE in "${DOTFILES[@]}"; do
    BACKUP_FILE="$BACKUP_DIR/$(basename "$FILE")"
    FILE_NAME=$(basename "$FILE")

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

# Restaura os diretórios
echo "Iniciando restauração dos diretórios..."
for DIR in "${DIRECTORIES[@]}"; do
    DIR_NAME=$(basename "$DIR")
    BACKUP_DIR_PATH="$BACKUP_DIR/$DIR_NAME"

    if [ -d "$BACKUP_DIR_PATH" ]; then
        if [ -d "$DIR" ]; then
            if confirm "$DIR_NAME"; then
                cp -r "$BACKUP_DIR_PATH" "$DIR"
                echo "Diretório $DIR_NAME restaurado."
            else
                echo "Diretório $DIR_NAME não foi sobrescrito."
            fi
        else
            cp -r "$BACKUP_DIR_PATH" "$DIR"
            echo "Diretório $DIR_NAME restaurado."
        fi
    else
        echo "Backup do diretório $DIR_NAME não encontrado em $BACKUP_DIR..."
    fi
done

echo "Fim do programa."
