-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.loop or vim.uv).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set mapleader BEFORE loading lazy.nvim
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Setup lazy.nvim with plugin specs
require('lazy').setup {
  spec = {
    -- Import plugins from 'plugins' directory
    { import = 'plugins' },

    -- Direct plugin specs can go here
    {
      'olimorris/onedarkpro.nvim',
      priority = 1000, -- Load before other plugins
      config = function()
        vim.cmd 'colorscheme onedark'
      end,
    },
    {
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- Automatically check for updates
  checker = { enabled = true },
}
