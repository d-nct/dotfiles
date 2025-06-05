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
    
    # NerdFont
    "$HOME/.fonts/FiraMonoNerdFontMono-Regular.otf"
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
