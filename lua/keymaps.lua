-- Open vertical split with :vsp or <leader>vs
vim.api.nvim_set_keymap("n", "<leader>vs", ":vsplit<CR>", { noremap = true })

-- Open horizontal split with :sp or <leader>hs
vim.api.nvim_set_keymap("n", "<leader>hs", ":split<CR>", { noremap = true })

