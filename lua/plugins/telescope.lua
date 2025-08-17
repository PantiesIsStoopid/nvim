return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local Opts = {
			noremap = true,
			silent = true,
		}
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", Opts)
		vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", Opts)
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", Opts)
		vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", Opts)
	end,
}
