return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			flavour = "mocha", -- or "latte", "frappe", "macchiato"
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},

				-- 🧩 Full list of integrations
				aerial = true,
				barbar = true,
				beacon = true,
				coc_nvim = true,
				dap = { enabled = true, enable_ui = true },
				dashboard = true,
				fidget = true,
				flash = true,
				harpoon = true,
				headlines = true,
				hop = true,
				illuminate = true,
				indent_blankline = { enabled = true, colored_indent_levels = false },
				leap = true,
				lsp_trouble = true,
				markdown = true,
				mason = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
				},
				neotest = true,
				neotree = true,
				noice = true,
				octo = true,
				overseer = true,
				rainbow_delimiters = true,
				semantic_tokens = true,
				symbols_outline = true,
				telescope = true,
				ts_rainbow = true,
				which_key = true,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
