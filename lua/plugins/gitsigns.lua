vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" }
})

local function setup_gitsigns()
  local ok, gitsigns = pcall(require, "gitsigns")
  if not ok then return end

  gitsigns.setup({
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
  })
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  callback = setup_gitsigns,
  desc = "Lazy load gitsigns.nvim",
})
