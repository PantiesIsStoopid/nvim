-- Open vertical split window with :vsp or <leader>vs shortcut
vim.api.nvim_set_keymap("n", "<leader>vs", ":vsplit<CR>", { noremap = true })

-- Open horizontal split window with :sp or <leader>hs shortcut
vim.api.nvim_set_keymap("n", "<leader>hs", ":split<CR>", { noremap = true })

-- Warn user to use h instead of left arrow for left movement
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')

-- Warn user to use l instead of right arrow for right movement
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')

-- Warn user to use k instead of up arrow for up movement
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')

-- Warn user to use j instead of down arrow for down movement
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Move cursor focus to the left split window with Ctrl+h
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })

-- Move cursor focus to the right split window with Ctrl+l
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- Move cursor focus to the split below with Ctrl+j
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })

-- Move cursor focus to the split above with Ctrl+k
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

