return {
	{
		"mbbill/undotree",
		config = function()
			vim.g.undotree_WindowLayout = 2
			vim.g.undotree_DiffCommand = "bat"
			vim.g.undotree_TreeNodeColor = "blue"
			vim.g.undotree_SetFocusWhenToggle = 1

			-- Keybinding to toggle undo tree window with Leader + U
			vim.api.nvim_set_keymap("n", "<Leader>u", ":UndotreeToggle<CR>", { noremap = true, silent = true })
		end,
	},
}
