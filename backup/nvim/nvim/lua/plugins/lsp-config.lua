return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					-- "bashls",
					-- "remark_ls",
					-- "jedi_language_server"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			-- Setup dos LSPs
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.remark_ls.setup({
				-- capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})                         -- shift+K mostra a doc
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})           -- goto definition
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})           -- goto referencias
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- actions genéricas
		end,
	},
}
