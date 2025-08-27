-----------------------------------------------------------
-- Core Vim Settings
-----------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
---@diagnostic disable-next-line: undefined-field
vim.g.startup_time = vim.loop.hrtime()

-----------------------------------------------------------init
-- Editor Behaviour
-----------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true
vim.opt.termguicolors = true
vim.opt.shell = "pwsh"
-----------------------------------------------------------
-- Indentation
-----------------------------------------------------------
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.shiftround = true

-----------------------------------------------------------
-- Disable useless plugins
-----------------------------------------------------------

vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

-----------------------------------------------------------
-- Plugin Manager (Lazy)
-----------------------------------------------------------
require("config.lazy")
require("config.keybinds")
require("config.floatingterminal")

-- Run code with F5 based on filetype
vim.keymap.set("n", "<F5>", function()
  local ft = vim.bo.filetype
  local file = vim.fn.expand("%:p")
  local cmd = ""

  if ft == "python" then
    cmd = "python " .. file
  elseif ft == "cpp" then
    local exe = vim.fn.expand("%:r") .. ".exe"
    cmd = "g++ -std=c++17 -O2 -Wall " .. file .. " -o " .. exe .. " && " .. exe
  elseif ft == "c" then
    local exe = vim.fn.expand("%:r") .. ".exe"
    cmd = "gcc -O2 -Wall " .. file .. " -o " .. exe .. " && " .. exe
  elseif ft == "rust" then
    cmd = "cargo run"
  elseif ft == "go" then
    cmd = "go run " .. file
  elseif ft == "javascript" then
    cmd = "node " .. file
  elseif ft == "typescript" then
    cmd = "ts-node " .. file
  else
    print("No run command set for filetype: " .. ft)
    return
  end

  vim.cmd("split | terminal " .. cmd)
end, { desc = "Run code" })
