return {
	-- Rust Tools & LSP
	{
		"simrat39/rust-tools.nvim",
		ft = { "rust" }, -- Only load for Rust files
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim",
			"saecki/crates.nvim", -- Crates version info & completion
		},
		config = function()
			local rt = require("rust-tools")
			local mason = require("mason")
			local mason_lsp = require("mason-lspconfig")
			local fidget = require("fidget")

			mason.setup()
			mason_lsp.setup({
				ensure_installed = { "rust_analyzer" },
			})

			fidget.setup({})

			-- Rust Tools Setup
			rt.setup({
				server = {
					on_attach = function(client, bufnr)
						local opts = { noremap = true, silent = true, buffer = bufnr }
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", unpack(opts) })
						vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation", unpack(opts) })
						vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol", unpack(opts) })
						vim.keymap.set(
							"n",
							"<leader>ca",
							vim.lsp.buf.code_action,
							{ desc = "Code action", unpack(opts) }
						)
						vim.diagnostic.config({
							virtual_text = { prefix = "●", spacing = 2 },
							signs = true,
							underline = true,
							update_in_insert = false,
						})
					end,
					capabilities = vim.lsp.protocol.make_client_capabilities(),
				},
				tools = {
					inlay_hints = { auto = true },
					hover_actions = { border = "rounded" },
				},
			})

			-- Crates.nvim Setup
			require("crates").setup({
				null_ls = { enabled = true },
				popup = { border = "rounded" },
			})
		end,
	},

	-- Formatter
	{
		"stevearc/conform.nvim",
		ft = { "rust" }, -- Only load for Rust files
		opts = {
			formatters_by_ft = {
				rust = { "rustfmt" },
			},
		},
	},
}
