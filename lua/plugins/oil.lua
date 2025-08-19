return {
	"stevearc/oil.nvim",
	opts = {
		view_options = {
			show_hidden = true,
		},
		columns = {
			"icon", -- Enable the icon column
		},
	},
	keys = { { "-", "<CMD>Oil<CR>", desc = "Open parent directory" } },
}
