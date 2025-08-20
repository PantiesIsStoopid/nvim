return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
	keys = {
		{ "<leader>dv", ":DiffviewOpen<CR>", desc = "Open Diffview" },
	},
	config = function()
		require("diffview").setup({
			diff_binaries = false, -- Show diffs for binaries
			enhanced_diff_hl = true,
			use_icons = true,
			signs = {
				fold_closed = "▶",
				fold_open = "▼",
			},
			view = {
				default = {
					layout = "diff2_horizontal", -- can also be 'diff1' or 'diff3'
					winbar_info = true,
				},
			},
			file_panel = {
				listing_style = "tree",
				tree_options = {
					flatten_dirs = true,
				},
			},
			file_history_panel = {
				log_options = { git = { single_file = { diff_merges = "first-parent" } } },
			},
		})
	end,
}
