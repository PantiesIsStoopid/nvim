-- LSP Setup
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_lsp = require("mason-lspconfig")
		local fidget = require("fidget")

		-- Mason Setup
		mason.setup()
		mason_lsp.setup({
			ensure_installed = { "clangd", "gopls", "pyright", "rust_analyzer", "lua_ls" },
		})

		-- Fidget Setup
		fidget.setup({})

		-- Capabilities for snippets and completion
		local Capabilities = vim.lsp.protocol.make_client_capabilities()
		Capabilities.textDocument.completion.completionItem.snippetSupport = true

		-- Keybindings for LSP
		local OnAttach = function(Client, Buffer)
			local opts = { noremap = true, silent = true, buffer = Buffer }

			vim.keymap.set(
				"n",
				"gd",
				"<cmd>lua vim.lsp.buf.definition()<CR>",
				{ desc = "Go to definition", unpack(opts) }
			)
			vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover documentation", unpack(opts) })
			vim.keymap.set(
				"n",
				"gr",
				"<cmd>lua vim.lsp.buf.references()<CR>",
				{ desc = "List references", unpack(opts) }
			)
			vim.keymap.set(
				"n",
				"gi",
				"<cmd>lua vim.lsp.buf.implementation()<CR>",
				{ desc = "Go to implementation", unpack(opts) }
			)
			vim.keymap.set(
				"n",
				"<leader>rn",
				"<cmd>lua vim.lsp.buf.rename()<CR>",
				{ desc = "Rename symbol", unpack(opts) }
			)
			vim.keymap.set(
				"n",
				"<leader>ca",
				"<cmd>lua vim.lsp.buf.code_action()<CR>",
				{ desc = "Code action", unpack(opts) }
			)
			vim.keymap.set(
				"n",
				"[d",
				"<cmd>lua vim.diagnostic.goto_prev()<CR>",
				{ desc = "Prev diagnostic", unpack(opts) }
			)
			vim.keymap.set(
				"n",
				"]d",
				"<cmd>lua vim.diagnostic.goto_next()<CR>",
				{ desc = "Next diagnostic", unpack(opts) }
			)
			vim.keymap.set(
				"n",
				"<leader>dl",
				"<cmd>lua vim.diagnostic.setloclist()<CR>",
				{ desc = "Diagnostic list", unpack(opts) }
			)

			-- Inline diagnostics
			vim.diagnostic.config({
				virtual_text = { prefix = "●", spacing = 2 },
				signs = true,
				underline = true,
				update_in_insert = false,
			})
		end

		-- LSP Servers Setup
		local Servers = { "clangd", "gopls", "pyright", "rust_analyzer", "lua_ls" }
		for _, Server in ipairs(Servers) do
			lspconfig[Server].setup({
				on_attach = OnAttach,
				capabilities = Capabilities,
			})
		end
	end,
}
