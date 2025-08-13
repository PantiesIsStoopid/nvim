return { {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()

    vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
  end
},
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("diffview").setup()
      local Opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<CR>", Opts)
      vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>", Opts)
    end
  } }
