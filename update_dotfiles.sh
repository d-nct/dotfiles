#!/bin/bash

# Carrega as listas de arquivos e diretórios
source ./configs.sh

# Cria o diretório de backup, se não existir
mkdir -p "$BACKUP_DIR"

# Faz o backup dos arquivos individuais
echo "Iniciando backup dos dotfiles..."
for FILE in "${DOTFILES[@]}"; do
    if [ -f "$FILE" ]; then
        echo -n "Salvando $FILE... " 
        rsync -a "$FILE" "$BACKUP_DIR" # -a mantém as permissões
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
	ARCHIVE="$BACKUP_DIR/${DIR_NAME}.tar.gz"

        echo -n "Salvando o diretório $DIR como tarball... "
	tar -czf "$ARCHIVE" -C "$(dirname "$DIR")" "$DIR_NAME"
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
