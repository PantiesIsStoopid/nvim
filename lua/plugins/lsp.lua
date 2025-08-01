return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			auto_install = true,
			ensure_installed = {
				"ts_ls", -- JS/TS
				"lua_ls", -- Lua
				"rust_analyzer", -- Rust
				"clangd", -- C/C++
				"html", -- HTML
				"cssls", -- CSS
				"pyright", -- Python
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local LspConfig = require("lspconfig")
			local Capabilities = require("cmp_nvim_lsp").default_capabilities()

			LspConfig.ts_ls.setup({
				Capabilities = Capabilities,
			})
			LspConfig.lua_ls.setup({
				Capabilities = Capabilities,
			})
			LspConfig.rust_analyzer.setup({
				Capabilities = Capabilities,
			})
			LspConfig.clangd.setup({
				Capabilities = Capabilities,
			})
			LspConfig.html.setup({
				Capabilities = Capabilities,
			})
			LspConfig.cssls.setup({
				Capabilities = Capabilities,
			})
			LspConfig.pyright.setup({
				Capabilities = Capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
