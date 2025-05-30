return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local Capabilities = require('cmp_nvim_lsp').default_capabilities()

      local Lspconfig = require("lspconfig")
      Lspconfig.ts_ls.setup({ capabilities = Capabilities })
      Lspconfig.solargraph.setup({ capabilities = Capabilities })
      Lspconfig.html.setup({ capabilities = Capabilities })
      Lspconfig.lua_ls.setup({ capabilities = Capabilities })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Show references" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
    end,
  },
}

