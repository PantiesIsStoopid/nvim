vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

local function setup_lualine()
  local function Clock()
    return os.date("%I:%M")
  end

  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then return end

  lualine.setup({
    options = {
      theme = "auto",
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = {},
      lualine_y = { "location" },
      lualine_z = { Clock },
    },
  })
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = setup_lualine,
  desc = "Setup lualine.nvim statusline",
})
