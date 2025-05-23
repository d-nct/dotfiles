-- Para restaurar as sessões posteriormente
return {
	{
		"tpope/vim-obsession",
		-- enabled = false,
		config = function()
			vim.keymap.set("n", "<leader>g", ":Obsession<CR>",
				{ desc = "Iniciar/Parar Obsession", noremap = true, silent = true })
			vim.keymap.set("n", "<leader>b", ":source Session.vim<CR>",
				{ desc = "Carregar Sessão", noremap = true, silent = true })
			vim.keymap.set("n", "<leader>s", ":ObsessionStatus<CR>",
				{ desc = "Ver Status da Sessão", noremap = true, silent = true })
		end,
	},
}
