return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- or "tabs"
        numbers = 'ordinal',
        separator_style = 'slant', -- "slant" | "slope" | "thin" | "thick" | "padded_slant"
        diagnostics = 'nvim_lsp',
        show_buffer_close_icons = true,
        show_close_icon = false,
        always_show_bufferline = true,
      },
    }
  end,
}
