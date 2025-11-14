vim.pack.add({
  { src = "https://github.com/karb94/neoscroll.nvim" }
})

local function setup_neoscroll()
  local ok, neoscroll = pcall(require, "neoscroll")
  if not ok then return end
  neoscroll.setup({})
end

vim.api.nvim_create_autocmd("BufEnter", {
  callback = setup_neoscroll,
  desc = "Lazy load neoscroll.nvim",
})
