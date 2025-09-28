return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/lazydev.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      local LspConfig = require("lspconfig")
      local Mason = require("mason")
      local MasonLsp = require("mason-lspconfig")
      local BlinkCmp = require("blink.cmp")

      -- Mason setup
      Mason.setup()
      MasonLsp.setup({
        ensure_installed = { "pyright", "lua_ls", "clangd" },
        automatic_installation = true,
      })

      -- LSP servers config
      local Servers = {
        pyright = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        },
        clangd = {},
      }

      -- Setup LSP servers with Blink capabilities
      for Name, ServerOpts in pairs(Servers) do
        ServerOpts.capabilities = BlinkCmp.get_lsp_capabilities(ServerOpts.capabilities or {})
        LspConfig[Name].setup(ServerOpts)
      end

      -- Diagnostics config
      vim.diagnostic.config({
        virtual_text = { prefix = "●", spacing = 2 },
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
      })

      -- LSP keymaps
      local Keymaps = {
        { "n", "K",          vim.lsp.buf.hover,       "LSP Hover" },
        { "n", "gd",         vim.lsp.buf.definition,  "Go to Definition" },
        { "n", "<leader>rn", vim.lsp.buf.rename,      "Rename" },
        { "n", "<leader>f",  vim.lsp.buf.format,      "Format Document" },
        { "n", "<leader>ca", vim.lsp.buf.code_action, "Code Action" },
      }
      for _, km in ipairs(Keymaps) do
        vim.keymap.set(km[1], km[2], km[3], { desc = km[4] })
      end

      -- Auto-format on save
      local FormatGroup = vim.api.nvim_create_augroup("LspFormat", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = FormatGroup,
        callback = function(args)
          local Client = vim.lsp.get_client_by_id(args.data.client_id)
          if Client and Client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = FormatGroup,
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
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  "saghen/blink.cmp",
}
