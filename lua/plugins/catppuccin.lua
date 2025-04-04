return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          telescope = true,
          treesitter = true,
          nvimtree = true
        }
      })
      -- Load the colorscheme
      vim.cmd("colorscheme catppuccin-mocha")
    end
},}


