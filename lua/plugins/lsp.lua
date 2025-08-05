return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      auto_install = true,
      ensure_installed = {
        "ts_ls",  -- JS/TS
        "lua_ls",    -- Lua
        "rust_analyzer", -- Rust
        "clangd",    -- C/C++
        "html",      -- HTML
        "cssls",     -- CSS
        "pyright",   -- Python
        "jsonls",    -- JSON
        "yamlls",    -- YAML
        "bashls",    -- Bash
        "dockerls",  -- Docker
        "eslint",    -- JS/TS lint
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local LspConfig = require("lspconfig")
      local Capabilities = require("cmp_nvim_lsp").default_capabilities()

      local Servers = {
        "ts_ls",
        "lua_ls",
        "rust_analyzer",
        "clangd",
        "html",
        "cssls",
        "pyright",
        "jsonls",
        "yamlls",
        "bashls",
        "dockerls",
      }

      for _, Server in ipairs(Servers) do
        LspConfig[Server].setup({ Capabilities = Capabilities })
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
