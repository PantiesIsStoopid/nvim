return {
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.8",
		cmd = { "Telescope" },
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Telescope Find Files",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Telescope Live Grep",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Telescope Buffers",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Telescope Help Tags",
			},
		},
		config = function()
			local Telescope = require("telescope")
			Telescope.setup({})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		lazy = true,
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			local Telescope = require("telescope")
			local Themes = require("telescope.themes")
			Telescope.setup({
				extensions = {
					["ui-select"] = Themes.get_dropdown({}),
				},
			})
			Telescope.load_extension("ui-select")
		end,
	},
}
