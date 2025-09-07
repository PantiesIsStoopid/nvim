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
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Setup nvim-cmp capabilities
      local Capabilities = vim.lsp.protocol.make_client_capabilities()
      Capabilities = require("cmp_nvim_lsp").default_capabilities(Capabilities)

      -- Setup LSP servers
      local Servers = { "pyright", "lua_ls", "rust_analyzer", "clangd" }
      for _, Name in ipairs(Servers) do
        require("lspconfig")[Name].setup({
          Capabilities = Capabilities,
        })
      end

      -- Diagnostics configuration (inline + gutter + underline)
      vim.diagnostic.config({
        virtual_text = { prefix = "●", spacing = 2 },
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
      })

      -- LSP keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Document" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

      -- Auto-format on save if supported
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local Client = vim.lsp.get_client_by_id(args.data.client_id)
          if Client and Client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = vim.api.nvim_create_augroup("LspFormat", { clear = false }),
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 1000 })
              end,
            })
          end
        end,
      })
    end,
  },
}
