return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim",          opts = {} },
      { "mason-org/mason-lspconfig.nvim" },
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", event = "LspAttach", config = true },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local Map = function(Keys, Func, Desc, Mode)
            Mode = Mode or "n"
            vim.keymap.set(Mode, Keys, Func, { buffer = event.buf, desc = "LSP: " .. Desc })
          end

          Map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
          Map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
          Map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
          Map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
          Map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
          Map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
          Map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
          Map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
          Map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")

          local Client = vim.lsp.get_client_by_id(event.data.client_id)
          if Client and Client.supports_method("textDocument/inlayHint") then
            Map("<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, "[T]oggle Inlay [H]ints")
          end
        end,
      })

      vim.diagnostic.config({
        severity_sort = true,
        float = { border = "rounded", source = "if_many" },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          },
        } or {},
        virtual_text = { source = "if_many", spacing = 2 },
      })

      local Capabilities = require("blink.cmp").get_lsp_capabilities()

      local EnsureInstalled = {
        -- LSPs
        "lua_ls",
        "clangd",
        "pyright",
        "html",
        "cssls",
        "jsonls",
        "marksman", -- markdown
        "cmake",
        "powershell_es",
        "texlab", -- LaTeX

        -- Formatters / Linters
        "stylua",   -- Lua
        "clang-format", -- C / C++ / OpenGL / Arduino
        "black",    -- Python
        "isort",    -- Python imports
        "prettier", -- JS/TS/HTML/CSS/JSON/Markdown/YAML
        "latexindent", -- LaTeX
        "taplo",    -- TOML
      }

      require("mason-tool-installer").setup({ ensure_installed = EnsureInstalled })

      require("mason-lspconfig").setup({
        automatic_installation = true,
        handlers = {
          function(ServerName)
            local Server = Servers[ServerName] or {}
            Server.capabilities = vim.tbl_deep_extend("force", {}, Capabilities, Server.capabilities or {})
            require("lspconfig")[ServerName].setup(Server)
          end,
        },
      })
    end,
  },
}
