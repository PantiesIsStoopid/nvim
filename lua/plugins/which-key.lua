vim.pack.add({
  { src = "https://github.com/folke/which-key.nvim" }
})

local function setup_which_key()
  local ok, wk = pcall(require, "which-key")
  if not ok then return end

  wk.setup({})
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = setup_which_key,
  desc = "Setup Which-Key",
})
