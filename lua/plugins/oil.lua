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
		},
		vim.keymap.set("n", "-", function()
			require("oil").toggle_float()
		end, { desc = "Open Oil floating window in parent directory" }),
	},
}
