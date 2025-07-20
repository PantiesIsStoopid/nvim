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
				symbols_outline = true,
				telescope = true,
				which_key = true,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
