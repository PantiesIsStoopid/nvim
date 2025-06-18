-- Basic Vim settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set autoindent")

vim.opt.numberwidth = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.o.mouse = ""

-- Get home directory in a portable way
local home = vim.loop.os_homedir() or os.getenv("HOME")

-- Undo directory inside the home folder, works for all OSes
vim.o.undodir = home .. "/.local/share/nvim/undo"
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.undoreload = 10000

-- Bootstrap lazy.nvim remains unchanged
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

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Set the undo directory and enable persistent undo for Windows
vim.o.undodir = "C:\\Users\\Nyle\\AppData\\Local\\nvim-data\\undo"

-- Disable the mouse
vim.o.mouse = ""

-- Enable persistent undo
vim.o.undofile = true

-- Optional settings to increase undo levels
vim.o.undolevels = 1000 -- Increase the number of undo levels
vim.o.undoreload = 10000 -- Increase the number of lines to keep in memory

local IgnoredCodes = {}

function ToggleIgnoreCode()
	local Buf = vim.api.nvim_get_current_buf()
	local Line = vim.api.nvim_win_get_cursor(0)[1] - 1
	local Diags = vim.diagnostic.get(Buf, { lnum = Line })
	if #Diags == 0 then
		print("No diagnostics on this line")
		return
	end

	local Code = Diags[1].code or Diags[1].user_data and Diags[1].user_data.lsp.code
	if not Code then
		print("No diagnostic code available to ignore")
		return
	end

	IgnoredCodes[Code] = not IgnoredCodes[Code]

	print((IgnoredCodes[Code] and "Ignoring" or "Unignoring") .. " diagnostic code: " .. tostring(Code))
	vim.diagnostic.reset(nil, Buf)
end

local OriginalHandler = vim.lsp.diagnostic.on_publish_diagnostics

vim.lsp.diagnostic.on_publish_diagnostics = function(err, result, ctx, config)
	if result and result.diagnostics then
		local Filtered = {}
		for _, Diag in ipairs(result.diagnostics) do
			local Code = Diag.code or (Diag.user_data and Diag.user_data.lsp and Diag.user_data.lsp.code)
			if not (Code and IgnoredCodes[Code]) then
				table.insert(Filtered, Diag)
			end
		end
		result.diagnostics = Filtered
	end
	return OriginalHandler(err, result, ctx, config)
end

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.fn.setreg("+", vim.fn.getreg('"'))
	end,
})

vim.keymap.set("n", "<leader>ei", ToggleIgnoreCode, { desc = "Ignore current error code for session" })

-- Setup lazy.nvim
require("lazy").setup("plugins")
require("keymaps") -- This loads the keymaps.lua file
