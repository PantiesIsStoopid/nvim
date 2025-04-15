vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup("plugins")

vim.keymap.set("n", "<leader>rn", ":set relativenumber!<CR>")
vim.opt.numberwidth = 2

vim.api.nvim_set_hl(0, "DiagnosticSignError", {})
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", {})
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", {})
vim.api.nvim_set_hl(0, "DiagnosticSignHint", {})

for _, Type in ipairs({ "Error", "Warn", "Info", "Hint" }) do
  vim.fn.sign_define("DiagnosticSign" .. Type, { text = "", texthl = "None", numhl = "" })
end

