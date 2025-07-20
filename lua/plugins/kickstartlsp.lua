return {
	-- LSP Setup
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"j-hui/fidget.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			-- LSP capabilities from blink.cmp
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Your servers list
			local servers = {
				clangd = {},
				denols = {},
				jdtls = {},
				kotlin_language_server = {},
				lua_ls = {},
				marksman = {},
				omnisharp = {},
				phpactor = {},
				texlab = {},
				zls = {},
		  	sqlls	 = {},
				jsonls = {},
				cssls = {},
				html = {},
				pyright = {},
				taplo = {},
			}

			-- Setup Mason & ensure servers are installed
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				automatic_installation = true,
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"taplo",
					"prettier",
				},
				auto_update = true,
				run_on_start = true,
			})

			-- LSP server config
			for name, config in pairs(servers) do
				config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
				require("lspconfig")[name].setup(config)
			end

			-- LspAttach autocommand
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("user-lsp", { clear = true }),
				callback = function(ev)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
					end
					map("gd", vim.lsp.buf.definition, "Go to Definition")
					map("gr", vim.lsp.buf.references, "References")
					map("K", vim.lsp.buf.hover, "Hover")
					-- Add more keymaps as needed
				end,
			})

			-- Diagnostics
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})
		end,
	},

	-- Formatter (Conform)
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {
			notify_on_error = true,
			format_on_save = function(bufnr)
				local ignore = vim.tbl_contains({ "sqls" }, vim.bo[bufnr].filetype)
				return not ignore
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				toml = { "taplo" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				less = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				graphql = { "prettier" },
				vue = { "prettier" },
				svelte = { "prettier" },
			},
		},
	},

	-- Completion engine (blink.cmp)
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"folke/lazydev.nvim",
		},
		opts = {
			keymap = { preset = "default" },
			appearance = { nerd_font_variant = "mono" },
			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = { lazydev = { module = "lazydev.integrations.blink", score_offset = 100 } },
			},
			snippets = { preset = "luasnip" },
			signature = { enabled = true },
      fuzzy = {prebuilt_binaries = {
        force_version = "v1.0.0",

      },
      implementation = "prefer_rust",}
		},
	},
}

