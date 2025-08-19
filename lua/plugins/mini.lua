return {
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  config = function()
    require('mini.pairs').setup()
    require('mini.surround').setup()
    require('mini.statusline').setup()
    require('mini.comment').setup()
    require('mini.completion').setup()
    require('mini.snippets').setup()
    require('mini.diff').setup()
    require('mini.git').setup()
    require('mini.animate').setup {
      cursor = { enable = false },
      scroll = {
        enable = true,
      },
      resize = { enable = false },
      open = { enable = false },
      close = { enable = false },
    }
    require('mini.icons').setup()
  end,
}
