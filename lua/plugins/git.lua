return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    config = function()
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
    end,
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
    config = function()
      require("diffview").setup()
      local Opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<CR>", Opts)
    end,
  },
}
