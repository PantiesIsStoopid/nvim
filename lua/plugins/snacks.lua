vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim" }
})

require("snacks").setup({
  opts = {
    animate = {
      -- You can put your animate configuration here
      -- or leave it empty to use the default settings
    },
    indent = {
      -- Optional: configure indent settings
    },
  },
})
