return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "olimorris/onedarkpro.nvim" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "onedark_vivid", -- changed from catppuccin-mocha
				component_separators = "",
				section_separators = { left = "", right = "" },
				refresh = { statusline = 1000 },
			},
			sections = {
				lualine_a = { { "mode", right_padding = 2 } },
				lualine_b = { "branch" },
				lualine_c = { "%=" },
				lualine_x = {},
				lualine_y = { "filetype", "progress" },
				lualine_z = { { "location", left_padding = 2 } },
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
