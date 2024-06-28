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
# TODO
- [x] Script para restaurar dotfiles, podendo escolher quais devem ser sobrescritas.
- [ ] No script de restauração, mostrar uma tela usando o `diff` entre a versão atual do arquivo e a versão do backup.
