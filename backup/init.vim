 " Definições Puras dos NeoVim
" ---------------------------
:set encoding=UTF-8 " Codificação UTF-8
:set number         " Exibe o número de cada linha
" :set relativenumber " Exibe o número das linhas em relação à atual
:set autoindent     " <Tab> automático depois do <CR>
:set tabstop=4      " <Tab> faz 4 espaços
:set shiftwidth=4   " <Shift> faz 4 espaços
:set smarttab       " <Tab> no final de uma linha
:set softtabstop=4  " Faz alguma coisa aí
:set mouse=a        " Mouse em modo ativo
:set autoread       " Recarrega arquivos modificados fora do NVim
:set autochdir	    " Atualiza o diretório atual ao mudar de arquivo
:set clipboard=unnamedplus " Usa o clipboard do sistema
:set colorcolumn=80 " Adiciona linha marcando o fim da linha


" Instalando Plugins - Pluginstall
" --------------------------------
"  Instalar com `:PlugInstall`
call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
" Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/preservim/nerdtree', {'on': 'NERDTreeToggle'} " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar', {'on': 'TagbarToggle'} " Tagbar for code navigation
" Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/github/copilot.vim'
Plug 'https://github.com/dstein64/vim-startuptime'

" Plugins para LaTex
Plug 'https://github.com/lervag/vimtex', {'for': 'latex'}
Plug 'https://github.com/Konfekt/FastFold', {'for': 'latex'}
Plug 'https://github.com/matze/vim-tex-fold', {'for': 'latex'}
Plug 'https://github.com/emakman/nvim-latex-previewer', {'for': 'latex'}

" Plugin para python
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()


"   Configurando Plugins
"   --------------------
"   Tema
:colorscheme jellybeans " Põe esse tema bonito e cheiroso coloridíssimo

"   NerdTree - atalhos
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Deoplete (completador python)
let g:deoplete#enable_at_startup = 1

" Jedi (ainda python)
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

"   Vim Terminal - atalhos
"    Mostra o Tagbar, com organização do código atual
:nmap <F8> :TagbarToggle<CR> 

"    Para usar <Esc> para sair do terminal-mode:
:tnoremap <Esc> <C-\><C-n> 

:set completeopt-=preview " For No Previews

"   Para usar `ALT+{h,j,k,l}` para alternar entre abas:
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

"   air-line - configurações
let g:airline_powerline_fonts = 1 

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"   Símbolos do airline
let g:airline_left_sep = ''         "
let g:airline_left_alt_sep = ''     "
let g:airline_right_sep = ''        "
let g:airline_right_alt_sep = ''    " 
let g:airline_symbols.branch = ''   " Branch
let g:airline_symbols.readonly = '' " Modo somente leitura
let g:airline_symbols.linenr = ''   " linha

"   CoC (autocompletação) - atalhos
"    Para confirmar a sugestão
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>" 


"   VimTex - configurações
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
" let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
" use SumatraPDF if you are on Windows
let g:vimtex_view_method = 'skim'

" " NCM2 ???
" augroup NCM2
"   autocmd!
"   " some other settings...
"   " uncomment this block if you use vimtex for LaTex
"   autocmd Filetype tex call ncm2#register_source({
"             \ 'name': 'vimtex',
"             \ 'priority': 8,
"             \ 'scope': ['tex'],
"             \ 'mark': 'tex',
"             \ 'word_pattern': '\w+',
"             \ 'complete_pattern': g:vimtex#re#ncm2,
"             \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"             \ })
" augroup END
" ---- Fim das Configurações do VimTex

" MACROS
" ------
" :command vterm vnew term://bash
