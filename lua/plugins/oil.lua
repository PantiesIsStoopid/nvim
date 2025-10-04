return {
	{
		"JezerM/oil-lsp-diagnostics.nvim",
		dependencies = { "stevearc/oil.nvim" },
		opts = {},
	},
	{
		"stevearc/oil.nvim",
		opts = {
			view_options = {
				show_hidden = true,
			},
			columns = {
				"icon", -- Enable the icon column
			},
			float = { padding = 2, max_width = 80, max_height = 20, border = "rounded" },
		},
		vim.keymap.set("n", "-", function()
			require("oil").toggle_float()
		end, { desc = "Open Oil floating window in parent directory" }),
	},
}
