-- Necessário apt install exuberant-ctags
return {
	{
		"preservim/tagbar",
		-- enabled = false,
		config = function()
			vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", {
				noremap = true,
				silent = true,
			})
		end,
	},
}
