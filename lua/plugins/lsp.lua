return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },

    config = function()
      local Lsp = require("lspconfig")

      -- Setup LSP servers
      local Servers = {
        lua_ls = {},
        html = {},
        cssls = {},
        ts_ls = {}, -- for JS/TS/JSX
        jsonls = {},
        pyright = {},
        clangd = {}, -- for C/C++
        rust_analyzer = {},
        gopls = {},
      }

      for Name, Config in pairs(Servers) do
        Lsp[Name].setup(Config)
      end

      -- Keybinds + formatting on save
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local Client = vim.lsp.get_client_by_id(args.data.client_id)
          if not Client then return end

          local Buf = args.buf
          local Map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = Buf })
          end

          Map("n", "K", vim.lsp.buf.hover)
          Map("n", "<leader>gd", vim.lsp.buf.definition)
          Map("n", "<leader>gr", vim.lsp.buf.references)
          Map("n", "<leader>ca", vim.lsp.buf.code_action)
          Map("n", "<leader>gf", vim.lsp.buf.format)
          Map("n", "<space>rn", vim.lsp.buf.rename)

          if Client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = Buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = Buf, id = Client.id })
              end,
            })
          end
        end,
      })
    end,
  },
}
