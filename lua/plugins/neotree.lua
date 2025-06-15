return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		priority = 1000,
		branch = "v2.x",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				default_component_configs = {
					icon = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "",
						file = "",
					},
				},
				-- Show hidden files
				filesystem = {
					filtered_items = {
						visible = true, -- This will make hidden files visible
						hide_dotfiles = false, -- Do not hide dotfiles
						hide_gitignore = false, -- Show files ignored by Git
					},
				},
				close_if_last_window = true,
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,
			})

			vim.keymap.set("n", "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree file explorer" })
		end,
	},
}
