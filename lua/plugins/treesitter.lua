vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require('nvim-treesitter.configs').setup({
  ensure_installed = { "lua", "python", "rust", "typescript", "javascript", "css", "html", "json", "yaml", "markdown", "markdown_inline" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  auto_install = true,
})
