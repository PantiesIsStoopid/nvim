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
					"rust_analyzer",
					"pyright",
					"arduino_language_server",
					"html",
					"cssls",
					"denols",
					"eslint",
		 	},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local LspConfig = require("lspconfig")

			LspConfig.lua_ls.setup({})
			LspConfig.clangd.setup({})
			LspConfig.rust_analyzer.setup({})
			LspConfig.pyright.setup({})
			LspConfig.arduino_language_server.setup({})
			LspConfig.html.setup({})
			LspConfig.cssls.setup({})
			LspConfig.denols.setup({})
			LspConfig.eslint.setup({})

			vim.diagnostic.config({
				virtual_text = { prefix = "●", spacing = 4 },
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = false,
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = false,
		config = function()
			local NullLs = require("null-ls")
			NullLs.setup({
				sources = {
					NullLs.builtins.formatting.stylua,
					NullLs.builtins.formatting.clang_format,
					NullLs.builtins.formatting.rustfmt,
					NullLs.builtins.formatting.black,
					NullLs.builtins.formatting.prettier,
				},
			})
		end,
	},
}
