return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup()
        -- Corrected keymap: use <C-b> instead of "cntrl b"
        vim.keymap.set("n", "<C-b>", "<cmd>Oil<CR>", {
            noremap = true,
            silent = true
        })
    end
}
