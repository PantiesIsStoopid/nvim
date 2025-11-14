vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim" }
})

local function setup_snacks()
  local ok, snacks = pcall(require, "snacks")
  if not ok then return end

  snacks.setup({
    animate = {
    },
    indent = {},
  })
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = setup_snacks,
  desc = "Setup snacks.nvim",
})
