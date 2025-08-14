return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      use_icons = true
    })
    vim.keymap.set("n", "<C-b>", "<cmd>Oil<CR>", { noremap = true, silent = true })
  end
}
