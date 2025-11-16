return {

	-- Basic settings
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- LSP configuration for Lua, Python, and C/C++
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim", "require" } },
						workspace = { library = vim.api.nvim_get_runtime_file("", true) },
						telemetry = { enable = false },
					},
				},
			})



			require("lspconfig").pyright.setup({})
			require("lspconfig").clangd.setup({})
		end,
	},

	-- Mason plugins and tool installer
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = { "lua_ls", "pyright", "clangd", "stylua" },
			})
		end,
	},

	-- Snippet support
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"rafamadriz/friendly-snippets",
		event = "InsertEnter",
	},

	-- Completion and Blink CMP
	{
		"Saghen/blink.cmp",
		config = function()
			require("blink.cmp").setup({
				signature = { enabled = true },
				completion = {
					documentation = { auto_show = true, auto_show_delay_ms = 500 },
					menu = {
						auto_show = true,
						draw = {
							treesitter = { "lsp" },
							columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
						},
					},
				},
			})
		end,
	},

	-- Set up general options and mappings
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- General options
			vim.opt.number = true
			vim.opt.relativenumber = true
			vim.opt.tabstop = 2
			vim.opt.softtabstop = 2

			-- Keymap for formatting buffer
			vim.keymap.set("n", "<leader>fb", function()
				vim.lsp.buf.format({ async = true })
			end, { desc = "[F]ormat [B]uffer" })

			-- Format on save
			vim.cmd([[
        augroup LspFormat
          autocmd!
          autocmd BufWritePre * lua vim.lsp.buf.format({ async = true })
        augroup END
      ]])

			-- Hover documentation with 'K' keybinding
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Documentation" })
		end,
	},
}
