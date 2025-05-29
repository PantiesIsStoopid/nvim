return {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")
    require("notify").setup({
      stages = "slide", -- or "slide", "static", etc.
      timeout = 3000,
    })
  end,
}

