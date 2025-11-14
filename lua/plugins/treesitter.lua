vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
})

local function setup_treesitter()
  local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
  if not ok then return end

  ts_configs.setup({
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "ruby" },
    },
    indent = { enable = true, disable = { "ruby" } },
  })
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  callback = setup_treesitter,
  desc = "Setup nvim-treesitter",
})
