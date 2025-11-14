if vim.tbl_flatten then
  vim.tbl_flatten = function(tbl)
    return vim.iter(tbl):flatten():totable()
  end
end

vim.pack.add({
  { src = "https://github.com/norcalli/nvim-colorizer.lua" }
})

local colorizer = require("colorizer")

colorizer.setup({
  "*",                            -- enable for all buffers
  css = { rgb_fn = true },        -- enable rgb()/rgba() parsing
  html = { mode = "foreground" }, -- show color as text color in HTML
}, {
  mode = "background",            -- default preview mode
  names = true,                   -- enable color name parsing
})
