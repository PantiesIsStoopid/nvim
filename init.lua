-- =========================
-- General Settings
-- =========================
vim.g.mapleader = " "

-- =========================
-- Editor Appearance
-- =========================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- =========================
-- Mouse & Clipboard
-- =========================
vim.opt.clipboard = "unnamedplus"

-- =========================
-- Splits & Command Preview
-- =========================
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"

-- =========================
-- Tabs & Indentation
-- =========================
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.shiftround = true

vim.o.conceallevel = 1
-- =========================
-- Shell
-- =========================

vim.opt.shell = "pwsh"

-- =========================
-- Disable Built-in Plugins
-- =========================

vim.loader.enable()

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

vim.pack.add({
  { src = "https://github.com/catppuccin/nvim.git" },
})

vim.cmd("colorscheme catppuccin")

require("config.keybinds")
require("plugins.colorpreviews")
require("plugins.completions")
require("plugins.gitsigns")
require("plugins.lsp-config")
require("plugins.lualine")
require("plugins.neoscroll")
require("plugins.oil")
require("plugins.snacks")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.which-key")