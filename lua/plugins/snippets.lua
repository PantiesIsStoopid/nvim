return {
  -- Add blink.cmp plugin for autocompletion
  {
    'saghen/blink.cmp', -- Replace this with the actual plugin URL if necessary
    dependencies = {
      'hrsh7th/nvim-cmp', -- Dependency for the completion engine
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer', -- Buffer source for nvim-cmp
      'hrsh7th/cmp-path', -- Path source for nvim-cmp
      'hrsh7th/cmp-vsnip', -- Snippet source for nvim-cmp
    },
    config = function()
      -- Ensure completion is configured with blink.cmp capabilities
      require('cmp').setup {
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body) -- For using vsnip snippets
          end,
        },
        mapping = {
          ['<C-n>'] = require('cmp').mapping.select_next_item(),
          ['<C-p>'] = require('cmp').mapping.select_prev_item(),
          ['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
          ['<C-u>'] = require('cmp').mapping.scroll_docs(4),
          ['<C-Space>'] = require('cmp').mapping.complete(),
          ['<C-e>'] = require('cmp').mapping.close(),
          ['<CR>'] = require('cmp').mapping.confirm { select = true },
        },
        sources = {
          { name = 'nvim_lsp' }, -- Source for LSP-based completion
          { name = 'vsnip' }, -- If you're using vsnip for snippets
          { name = 'buffer' }, -- Buffer-based completion
          { name = 'path' }, -- Path completion
        },
      }

      -- Set capabilities for LSP to include snippet support
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Hook up the LSP servers with blink.cmp capabilities
      local on_attach = function(client, bufnr)
        -- Add completion capabilities to the client
        client.resolved_capabilities.textDocument.completion.completionItem.snippetSupport = true
        client.capabilities = vim.tbl_deep_extend('force', client.capabilities, capabilities)
      end

      local lsp_servers = {
        'clangd',
        'gopls',
        'pyright',
        'rust_analyzer',
        'lua-language-server',
        'html',
        'cssls',
        'typescript-language-server',
        'dockerfile-language-server',
        'taplo',
        'bashls',
        'cmake',
        'deno',
        'docker_language_server',
        'fish_lsp',
        'gh_actions_ls',
        'grammarly',
        'java_language_server',
        'jsonls',
        'rubocop',
        'ruby-lsp',
        'prettier',
      }

      -- Apply the `on_attach` to all LSP servers (this will hook the completion capabilities)
      require('lspconfig').clangd.setup { on_attach = on_attach }
      require('lspconfig').pyright.setup { on_attach = on_attach }
      require('lspconfig').rust_analyzer.setup { on_attach = on_attach }
      -- Add more LSP servers here as necessary
    end,
  },
}
