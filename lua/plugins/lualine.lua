return {
	"nvim-lualine/lualine.nvim",
	opts = {
		theme = "auto",
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = { "filename" },
			lualine_x = { "filetype" },
			lualine_y = { "location" }, -- line:column
			lualine_z = {},
		},
		options = {
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
