vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

require('conform').setup({
  format_on_save = true,
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { "black" },
    cpp = { "clang-format" },
    c = { "clang-format" },
  },
})
