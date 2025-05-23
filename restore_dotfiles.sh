#!/bin/bash

# Carrega as listas de arquivos e diretórios
source ./configs.sh

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
				    		mkdir -p "$(dirname $FILE)"
								cp "$BACKUP_FILE" "$FILE"
								echo "Arquivo $FILE_NAME restaurado."
						else
								echo "Arquivo $FILE_NAME não foi sobrescrito."
						fi
				else
				    mkdir -p "$(dirname $FILE)"
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
		ARCHIVE="$BACKUP_DIR/${DIR_NAME}.tar.gz"

		if [ -d "$ARCHIVE" ]; then
				if [ -d "$DIR" ]; then

						if confirm "$DIR_NAME"; then

								echo "Extraindo $ARCHIVE para $(dirname "$DIR") ..."
								tar -xzf "$ARCHIVE" -C "$(dirname "$DIR")"
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
