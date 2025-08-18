return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-telescope/telescope-fzy-native.nvim' },
  },
  config = function()
    local telescope = require 'telescope'

    telescope.setup {
      defaults = {
        prompt_prefix = '🔍 ',
        selection_caret = ' ',
        path_display = { 'smart' },
      },
      extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
        fzy_native = {
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
    }

    telescope.load_extension 'ui-select'
    telescope.load_extension 'fzy_native'

    -- Keymaps
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>ff', telescope.extensions.fzy_native and '<cmd>Telescope find_files<cr>' or '<cmd>Telescope find_files<cr>', opts)
    vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
    vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
  end,
}
