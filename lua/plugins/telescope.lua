return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- Only build if cmake is available (optional, but handy to avoid errors)
      build = function()
        if vim.fn.executable 'cmake' == 1 then
          vim.cmd '!cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release'
          vim.cmd '!cmake --build build --config Release'
          vim.cmd '!cmake --install build --prefix build'
        else
          print 'cmake not found, skipping telescope-fzf-native build'
        end
      end,
    },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
    }
    require('telescope').load_extension 'ui-select'
    pcall(require('telescope').load_extension, 'fzf')
  end,
  cmd = 'Telescope',
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags' },
  },
}
