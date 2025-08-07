return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "saghen/blink.cmp" },
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
      local Capabilities = require("blink.cmp").get_lsp_capabilities()
      local Lsp = require("lspconfig")

      local Servers = {
        lua_ls = {},
        html = {},
        cssls = {},
        ts_ls = {},
        jsonls = {},
        pyright = {},
        clangd = {},
        rust_analyzer = {},
        gopls = {},
      }

      for Name, Config in pairs(Servers) do
        Config.capabilities = Capabilities
        Lsp[Name].setup(Config)
      end

      -- Enable inline virtual text errors/warnings
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(Args)
          local Client = vim.lsp.get_client_by_id(Args.data.client_id)
          if not Client then return end

          local Buf = Args.buf
          local Map = function(Mode, Lhs, Rhs)
            vim.keymap.set(Mode, Lhs, Rhs, { buffer = Buf })
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
