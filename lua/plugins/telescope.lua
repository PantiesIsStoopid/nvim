-- Telescope + deps using vim.pack
vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons',              enabled = vim.g.have_nerd_font },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },

  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = "make", },
  { src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim', },
})

local telescope = require('telescope')

telescope.setup({
  extensions = {
    ['ui-select'] = require('telescope.themes').get_dropdown(),
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

-- Load extensions safely
pcall(telescope.load_extension, 'ui-select')
pcall(telescope.load_extension, 'fzf') -- <-- this must succeed

-----------------------
-- Keymaps
-----------------------
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(
    require('telescope.themes').get_dropdown({
      winblend = 10,
      previewer = false,
    })
  )
end)

vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep({
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  })
end)

vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files({ cwd = vim.fn.stdpath('config') })
end)
