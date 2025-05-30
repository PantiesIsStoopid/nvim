-- For `plugins/markview.lua` users.
return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  config = function()
    vim.keymap.set("n", "<leader>mp", function()
      vim.cmd("MarkviewToggle")
    end, { desc = "Toggle Markview Preview" })
  end,
}

