vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { desc = "Open [W]indow [V]ertically" }) -- Vertical split
vim.keymap.set("n", "<leader>wh", ":split<CR>", { desc = "Open [W]indow [H]orizontally" }) -- Horizontal split
vim.keymap.set("n", "<C-h>", "<C-w>h") -- Move left
vim.keymap.set("n", "<C-l>", "<C-w>l") -- Move right

vim.keymap.set("n", "<C-h>", "<C-w>h") -- Move to left window
vim.keymap.set("n", "<C-j>", "<C-w>j") -- Move to bottom window
vim.keymap.set("n", "<C-k>", "<C-w>k") -- Move to top window
vim.keymap.set("n", "<C-l>", "<C-w>l") -- Move to right window

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
