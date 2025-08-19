return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",

		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	config = function()
		local telescope = require("telescope")
		local sorters = require("telescope.sorters")

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
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		telescope.load_extension("ui-select")
		telescope.load_extension("fzf")

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
		vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
		vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
	end,
}
