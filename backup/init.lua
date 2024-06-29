vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },
  { import = "plugins" },

  -- Meus Plugins
  { "github/copilot.vim", lazy = false },
  { 'neovim/nvim-lspconfig', lazy = false }, -- Para clangd
  { "preservim/tagbar", lazy = false }, -- Tagbar com a estrutura do arquivo
                                        -- Precisa de apt install exuberant-ctags
  { 'hrsh7th/nvim-cmp', lazy = false},
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Configura identação para 4
vim.opt.tabstop    = 4    -- Número de colunas que uma tabulação representa
vim.opt.shiftwidth = 4    -- Número de espaços usados para cada nível de indentação
vim.opt.expandtab  = true -- Converte tabulações em espaços
vim.opt.autoindent = true -- Mantém a indentação da linha anterior

-- Compartilha a área de transferência
-- Precisa instalar sudo apt install xclip
vim.opt.clipboard = 'unnamedplus'

-- Mapear y para copiar para o clipboard do sistema
vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Y', '"+Y', { noremap = true, silent = true })

-- Mapear p para colar do clipboard do sistema
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'P', '"+P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'P', '"+P', { noremap = true, silent = true })

-- Números relativos à linha atual
vim.opt.number = true
vim.opt.relativenumber = true

-- vim.opt.autochdir = true -- Atualiza o diretório corrente ao mudar de arquivo
vim.opt.autoread = true -- Atualiza arquivos modificados fora do vim
vim.opt.colorcolumn = "80" -- Cria coluna marcando o fim da linha

-- Mapear a tecla Esc para sair do modo terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Início da configuração do clangd
require('lspconfig').clangd.setup {
    cmd = { "clangd" },  -- Certifique-se de que o clangd está no seu PATH
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = require('lspconfig/util').root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    -- Outras configurações personalizadas aqui
    on_attach = function(client, bufnr)
        -- Configurações específicas ao anexar o LSP ao buffer
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        -- Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mapeamento de teclas do LSP
        local opts = { noremap = true, silent = true }

        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<space>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<space>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
        buf_set_keymap('n', '<space>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end,
    flags = {
        debounce_text_changes = 150,
    }
}

-- Configuração do Tagbar
-- Mapeia a tecla F8 para abrir o Tagbar
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })

-- Configuração do copilot
vim.api.nvim_set_keymap('n', '<leader>cp', ':Copilot<CR>', { noremap = true, silent = true })

-- Configuração do nvim-cmp
-- Configuração do nvim-cmp
local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = false })
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  })
})
