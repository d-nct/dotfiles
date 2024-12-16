let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/.config/nvim/lua/plugins/vim-obsession.lua
badd +5 ~/.config/nvim/lua/plugins/neo-tree.lua
badd +2 ~/.config/nvim/lua/plugins/lsp-config.lua
badd +1 ~/.config/nvim/lua/plugins/gitsigns.lua
badd +54 ~/.config/nvim/lua/plugins/completions.lua
badd +1 ~/.config/nvim/lua/plugins/neorg.lua
badd +1 ~/.config/nvim/lua/plugins/treesitter.lua
badd +26 ~/.config/nvim/lua/plugins/telescope.lua
badd +8 ~/.config/nvim/lua/plugins/tagbar.lua
argglobal
%argdel
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
