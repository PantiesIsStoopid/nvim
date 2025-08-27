-- =========================
-- General Settings
-- =========================
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
---@diagnostic disable-next-line: undefined-field
vim.g.startup_time = vim.loop.hrtime()

-- =========================
-- Editor Appearance
-- =========================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.breakindent = true

-- =========================
-- Mouse & Clipboard
-- =========================
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- =========================
-- Search & Case
-- =========================
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- =========================
-- Splits & Command Preview
-- =========================
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"

-- =========================
-- Undo, Updates & Timeout
-- =========================
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.confirm = true

-- =========================
-- Tabs & Indentation
-- =========================
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.shiftround = true

-- =========================
-- Shell
-- =========================
vim.opt.shell = "pwsh"

-- =========================
-- Disable Built-in Plugins
-- =========================
local disabled_plugins = {
	"gzip",
	"tar",
	"tarPlugin",
	"zip",
	"zipPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"matchit",
	"2html_plugin",
	"logiPat",
	"rrhelper",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
}

for _, plugin in ipairs(disabled_plugins) do
	vim.g["loaded_" .. plugin] = 1
end

-- =========================
-- Load Config Modules
-- =========================
require("config.lazy")
require("config.keybinds")
require("config.floatingterminal")

-- =========================
-- Run Code With F5
-- =========================
vim.keymap.set("n", "<F5>", function()
	local Ft = vim.bo.filetype
	local File = vim.fn.expand("%:p")
	local Cmd = ""

	if Ft == "python" then
		Cmd = "python " .. File
	elseif Ft == "cpp" then
		local Exe = vim.fn.expand("%:r") .. ".exe"
		Cmd = "g++ -std=c++17 -O2 -Wall " .. File .. " -o " .. Exe .. " && " .. Exe
	elseif Ft == "c" then
		local Exe = vim.fn.expand("%:r") .. ".exe"
		Cmd = "gcc -O2 -Wall " .. File .. " -o " .. Exe .. " && " .. Exe
	elseif Ft == "rust" then
		Cmd = "cargo run"
	elseif Ft == "go" then
		Cmd = "go run " .. File
	elseif Ft == "javascript" then
		Cmd = "node " .. File
	elseif Ft == "typescript" then
		Cmd = "ts-node " .. File
	else
		print("No run command set for filetype: " .. Ft)
		return
	end

	vim.cmd("split | terminal " .. Cmd)
end, { desc = "Run code" })
