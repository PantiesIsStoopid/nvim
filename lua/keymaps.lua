-- Open vertical split with :vsp or <leader>vs
vim.api.nvim_set_keymap("n", "<leader>vs", ":vsplit<CR>", { noremap = true })

-- Open horizontal split with :sp or <leader>hs
vim.api.nvim_set_keymap("n", "<leader>hs", ":split<CR>", { noremap = true })

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
