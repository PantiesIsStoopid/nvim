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
				ensure_installed = {
					"bashls",
					"pyright",
					"lua_ls",
					"ts_ls",
					"rust_analyzer",
					"clangd",
					"html",
					"cssls",
					"gopls",
					"jdtls",
					"jsonls",
					"dockerls",
					"sqlls",
					"vimls",
					"yamlls",
					"lemminx",
					"zls",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"prettier",
					"clang-format",
					"black",
					"isort",
					"shfmt",
					"shellcheck",
					"markdownlint",
					"jsonlint",
					"htmlhint",
					"hadolint",
				},
				auto_update = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local Capabilities = require("cmp_nvim_lsp").default_capabilities()
			local Lspconfig = require("lspconfig")

			local Servers = {
				"bashls",
				"pyright",
				"lua_ls",
				"ts_ls",
				"clangd",
				"html",
				"cssls",
				"gopls",
				"jdtls",
				"jsonls",
				"dockerls",
				"sqlls",
				"vimls",
				"yamlls",
				"lemminx",
				"zls",
			}

			for _, Server in ipairs(Servers) do
				Lspconfig[Server].setup({ capabilities = Capabilities })
			end

			-- Rust Analyzer with diagnostics
			Lspconfig.rust_analyzer.setup({
				capabilities = Capabilities,
				settings = {
					["rust-analyzer"] = {
						diagnostics = { enable = true },
						cargo = { allFeatures = true },
						checkOnSave = true,
					},
				},
			})

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
