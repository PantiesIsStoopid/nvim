-- In your lazy config (e.g. ~/.config/nvim/lua/Plugins.lua)

return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      require("onedarkpro").setup({
        options = {
          transparency = false,
          terminal_colors = true,
        }
      })
      vim.cmd("colorscheme onedark_vivid") -- or onedark_dark / onedark_vivid
    end
  }
}

