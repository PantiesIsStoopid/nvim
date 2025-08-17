vim.opt.tabstop = 2 -- width of a tab character
vim.opt.shiftwidth = 2 -- width for autoindent
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.smartindent = true -- smart autoindenting
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	callback = function()
		vim.highlight.on_yank({
			timeout = 200,
		})
	end,
})

require("config.lazy")
