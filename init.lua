vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set autoindent")
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag = '-NoLogo -ExecutionPolicy Bypass -Command ". $PROFILE; "'

vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
	pattern = "*",
	command = "silent! wall",
})

vim.opt.numberwidth = 1

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.cmd("highlight CursorLineNr guifg=#f5e0dc gui=bold") -- Catppuccin Latte Rosewater

-- Setup lazy.nvim
require("lazy").setup("plugins")
require("keymaps") -- This loads the keymaps.lua file
require("diagnostics") -- This loads the diagnostics.lua file
require("autoupdate").AutoUpdate() -- This loads the autoupdate.lua file
