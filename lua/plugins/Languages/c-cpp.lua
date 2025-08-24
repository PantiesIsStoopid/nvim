return {
	-- LSP & Tools
	{
		"neovim/nvim-lspconfig",
		ft = { "c", "cpp" }, -- Only load for C/C++ files
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason = require("mason")
			local mason_lsp = require("mason-lspconfig")
			local fidget = require("fidget")

			mason.setup()
			mason_lsp.setup({
				ensure_installed = { "clangd" },
			})

			fidget.setup({})

			local OnAttach = function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", unpack(opts) })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation", unpack(opts) })
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol", unpack(opts) })
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", unpack(opts) })
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic", unpack(opts) })
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic", unpack(opts) })
				vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostic list", unpack(opts) })

				vim.diagnostic.config({
					virtual_text = { prefix = "●", spacing = 2 },
					signs = true,
					underline = true,
					update_in_insert = false,
				})
			end

			lspconfig.clangd.setup({
				on_attach = OnAttach,
				capabilities = vim.lsp.protocol.make_client_capabilities(),
				cmd = { "clangd", "--background-index", "--clang-tidy" },
			})
		end,
	},

	-- Formatter
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			format_on_save = true,
		},
	},
}
