return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup()
    vim.keymap.set("n", "<leader>td", function()
      local LineNr = vim.api.nvim_win_get_cursor(0)[1]
      local Line = vim.api.nvim_buf_get_lines(0, LineNr - 1, LineNr, false)[1]

      if Line:match("^%s*%-%-%s*TODO:") then
        -- Remove TODO comment prefix
        local NewLine = Line:gsub("^%s*%-%-%s*TODO:%s*", "")
        vim.api.nvim_buf_set_lines(0, LineNr - 1, LineNr, false, { NewLine })
      else
        -- Add TODO comment prefix (force format)
        local CleanLine = Line:gsub("^%s*%-%-?%s*", "") -- Remove existing comment markers if any
        vim.api.nvim_buf_set_lines(0, LineNr - 1, LineNr, false, { "-- TODO: " .. CleanLine })
      end
    end, { desc = "Toggle TODO comment on current line" })
  end,
}
