return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
		vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
		vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
	end,
}
