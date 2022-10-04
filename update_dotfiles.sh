#!/bin/bash
HOJE=`date +”%d-%b-%Y”`

# Atualizamos init.vim
cp -f /home/danieln/.config/nvim/init.vim .

# Atualizamos o .vimrc
cp -f /home/danieln/.vimrc .

# Commit
# git add *
# git commit -m \"$HOJE\"
# git push -u origin main
# TODO: commit e push automático
