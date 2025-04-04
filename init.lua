vim.opt.tabstop = 2         -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 2      -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true    -- Use spaces instead of tabs

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({ { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" },
			{ "\nPress any key to exit..." } }, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup `mapleader` and `maplocalleader`
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- Setup lazy.nvim
require("lazy").setup("plugins")

-- Keybinding to toggle absolute/relative line numbers with Ctrl + l
vim.keymap.set("n", "<C-l>", function()
	if vim.wo.number then
		vim.wo.number = false
		vim.wo.relativenumber = false
	else
		vim.wo.relativenumber = false
		vim.wo.number = true
	end
end)

-- Ctrl + S to format the current document
vim.keymap.set("n", "<C-s>", function()
	vim.lsp.buf.format({
		async = true
	})
end)

vim.keymap.set("n", "<C-d>", function()
	local current_state = vim.diagnostic.is_disabled()
	if current_state then
		vim.diagnostic.enable()
		vim.notify("Diagnostics Enabled")
	else
		vim.diagnostic.disable()
		vim.notify("Diagnostics Disabled")
	end
end)

-- Automatically check for plugin updates
vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerSync]])
