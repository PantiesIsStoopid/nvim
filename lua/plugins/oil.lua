vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})
require("oil").setup({
	columns = {
		"icon",
	},
	show_hidden = true,
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
