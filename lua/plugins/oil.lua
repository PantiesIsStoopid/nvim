vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/JezerM/oil-lsp-diagnostics.nvim" },
})


local function setup_oil()
  local ok, oil = pcall(require, "oil")
  if not ok then return end

  oil.setup({
    view_options = {
      show_hidden = true,
    },
    columns = { "icon" }, 
  })

  vim.keymap.set("n", "-", function()
    require("oil").toggle_float()
  end, { desc = "Open Oil floating window in parent directory" })
end

local function setup_oil_lsp()
  local ok, oil_lsp = pcall(require, "oil-lsp-diagnostics")
  if not ok then return end
  oil_lsp.setup({})
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    setup_oil()
    setup_oil_lsp()
  end,
  desc = "Setup oil.nvim and oil-lsp-diagnostics.nvim",
})
