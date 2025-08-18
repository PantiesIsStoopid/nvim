return {
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  config = function()
    require('mini.pairs').setup()
    require('mini.surround').setup()
    require('mini.statusline').setup()
  end,
}
