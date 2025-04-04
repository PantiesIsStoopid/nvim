return {
  -- Mason (LSP Installer)
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      mason_lspconfig.setup() -- No ensure_installed!

      -- Auto-install LSP for opened file types
      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({})
        end,
      })

      -- Auto-install missing LSPs when opening a file
      vim.api.nvim_create_autocmd("BufReadPost", {
        callback = function()
          local filetype = vim.bo.filetype
          local available_servers = mason_lspconfig.get_available_servers()

          for _, server in ipairs(available_servers) do
            if lspconfig[server] and not lspconfig[server].manager then
              lspconfig[server].setup({})
            end
          end
        end,
      })
    end,
  },
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
  },
  -- Autocompletion (CMP)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }),
      })
    end,
  },
}
