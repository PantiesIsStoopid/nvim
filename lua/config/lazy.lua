local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
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

-- Leader keys before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Lazy.nvim setup
require("lazy").setup({
  spec = {
    { import = "plugins" },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
        vim.cmd.colorscheme "catppuccin"
      end,
    }
  },

  checker = { enabled = true },
  install = { missing = true },
  defaults = { version = "*" },
})
