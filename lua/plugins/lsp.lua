return {
  -- Mason for managing LSPs
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "rust_analyzer",
          "gopls",
          "pyright",
          "html",
          "cssls",
          "lua_ls",
          "powershell_es",
        },
      })
    end,
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim", "mason-lspconfig.nvim" },
    config = function()
      local nvim_lsp = require("lspconfig")
      local servers = {
        "clangd",
        "rust_analyzer",
        "gopls",
        "pyright",
        "html",
        "cssls",
        "lua_ls",
        "powershell_es",
      }

      for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup({
          on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

            -- Format on save
            if client.server_capabilities.documentFormattingProvider then
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("LspFormat", { clear = true }),
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format({ async = false })
                end,
              })
            end
          end,
          flags = { debounce_text_changes = 150 },
        })
      end

      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },

  -- Completion & Snippets
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
        },
        experimental = { ghost_text = true },
      })
    end,
  },
}
