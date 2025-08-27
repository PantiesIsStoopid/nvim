return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer", "clangd", "pyright" },
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = { "stylua", "prettier", "rustfmt", "clang-format", "black", "isort" },
				auto_update = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local Capabilities = require("cmp_nvim_lsp").default_capabilities()
			local Lspconfig = require("lspconfig")
			local Servers = { "lua_ls", "ts_ls", "rust_analyzer", "clangd", "jsonls", "pyright" }

			for _, Server in ipairs(Servers) do
				Lspconfig[Server].setup({ capabilities = Capabilities })
			end

			vim.diagnostic.config({
				virtual_text = { prefix = "●", spacing = 2 },
				signs = true,
				update_in_insert = true,
				underline = true,
				severity_sort = true,
			})

			local Keymaps = {
				{ "n", "K", vim.lsp.buf.hover, "LSP Hover" },
				{ "n", "gd", vim.lsp.buf.definition, "Go to Definition" },
				{ "n", "<leader>rn", vim.lsp.buf.rename, "Rename" },
				{ "n", "<leader>f", vim.lsp.buf.format, "Format Document" },
				{ "n", "<leader>ca", vim.lsp.buf.code_action, "Code Action" },
			}
			for _, M in ipairs(Keymaps) do
				vim.keymap.set(M[1], M[2], M[3], { desc = M[4] })
			end
		end,
	},
}
