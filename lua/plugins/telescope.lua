return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"echasnovski/mini.fuzzy",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local sorters = require("telescope.sorters")
		local mini_fuzzy = require("mini.fuzzy")

		telescope.setup({
			defaults = {
				prompt_prefix = "🔍 ",
				selection_caret = " ",
				path_display = { "smart" },
				file_sorter = sorters.get_fuzzy_file,
				generic_sorter = sorters.get_generic_fuzzy_sorter,
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable mini.fuzzy integration
		mini_fuzzy.setup()

		telescope.load_extension("ui-select")

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
		vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
		vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
	end,
}
