require "nvchad.options"

-- Abreviação para configurar as opções
local o = vim.opt

-- Função para configurar indentação
-- local function set_indent(width)
--     vim.bo.shiftwidth = width
--     vim.bo.tabstop = width
--     vim.bo.softtabstop = width
--     vim.bo.expandtab = true
-- end

-- Autocommands para diferentes linguagens
vim.cmd([[
    augroup Indentation
        autocmd!
        autocmd FileType lua setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
        autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
        autocmd FileType javascript,typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
        autocmd FileType c,cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
        autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=0
    augroup END
]])
-- vim.opt.tabstop    = 4    -- Número de colunas que uma tabulação representa
-- vim.opt.shiftwidth = 4    -- Número de espaços usados para cada nível de indentação
-- vim.opt.expandtab  = true -- Converte tabulações em espaços
-- vim.opt.autoindent = true -- Mantém a indentação da linha anterior

-- Compartilha a área de transferência
o.clipboard = 'unnamedplus' -- Necessário apt install xclip


-- Números relativos à linha atual
o.number = true
o.relativenumber = true

-- vim.opt.autochdir = true -- Atualiza o diretório corrente ao mudar de arquivo
o.autoread = true -- Atualiza arquivos modificados fora do vim
o.colorcolumn = "80" -- Cria coluna marcando o fim da linha
