return {
	{
		"nvimtools/none-ls.nvim",
		lazy = false,
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- Instalar com Mason e colocar aqui
					null_ls.builtins.formatting.stylua, -- lua
					-- null_ls.builtins.formatting.doctoc, -- markdown
					-- null_ls.builtins.formatting.clang-format, -- c / c++ / java / ...
					null_ls.builtins.formatting.isort, -- python
					null_ls.builtins.formatting.black, -- python
				},
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {}) -- formata tudo com gf
		end,
	},
}
