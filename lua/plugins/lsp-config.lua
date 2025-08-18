return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
    },
    config = function()
      require('neodev').setup()

      -- Capabilities for nvim-cmp
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require 'lspconfig'

      -- Language server configurations
      local servers = {
        clangd = {},
        gopls = {},
        pyright = {},
        rust_analyzer = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { 'vim' } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
        html = {},
        cssls = {},
        ts_ls = {},
        dockerls = {},
        taplo = {},
      }

      -- Setup each server
      for server, config in pairs(servers) do
        config.capabilities = capabilities
        lspconfig[server].setup(config)
      end
    end,
  },

  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    opts = {
      ensure_installed = {
        -- LSPs
        'clangd',
        'gopls',
        'pyright',
        'rust-analyzer',
        'lua-language-server',
        'html-lsp',
        'css-lsp',
        'typescript-language-server',
        'dockerfile-language-server',
        'taplo',
        -- Formatters
        'stylua',
        'black',
        'isort',
        'prettierd',
        'clang-format',
        'gofumpt',
        -- Debug Adapters
        'cpptools', -- C/C++
        'debugpy', -- Python
        'node-debug2-adapter', -- JS/TS
        'delve', -- Go
      },
    },
  },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = 'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'prettierd',
        'stylua',
        'isort',
        'black',
        'clang-format',
      },
    },
  },

  {
    'j-hui/fidget.nvim',
    event = 'LspAttach',
    opts = {},
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        }),
      }
    end,
  },
}
