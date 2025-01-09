return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true, -- para as linguagens
				highlight = { enabled = true },
				indent = { enable = true },
			})
		end,
	},
}
