return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = '┃' },
          change = { text = '┃' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' }
        },
        signs_staged = {
          add = { text = '┃' },
          change = { text = '┃' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' }
        },
        on_attach = function(Bufnr)
          local Gitsigns = require("gitsigns")
          local function Map(Mode, Lhs, Rhs, Opts)
            Opts = Opts or {}
            Opts.buffer = Bufnr
            vim.keymap.set(Mode, Lhs, Rhs, Opts) 
          end
          Map('n', '<leader>gb', function()
            Gitsigns.toggle_current_line_blame()
          end, { desc = "Toggle current line git blame" })
        end
      })
    end
  },
}

