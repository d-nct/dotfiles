require "nvchad.mappings"

local map = vim.keymap.set

-- Command mode com ;
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Sair do insert mode com jk
map("i", "jk", "<ESC>")

-- Mapear y para copiar para o clipboard do sistema
vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Y', '"+Y', { noremap = true, silent = true })

-- Mapear p para colar do clipboard do sistema
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'P', '"+P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'P', '"+P', { noremap = true, silent = true })

-- Mapear a tecla Esc para sair do modo terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

