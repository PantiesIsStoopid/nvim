-- Add fidget.nvim
vim.pack.add({
	{ src = "https://github.com/j-hui/fidget.nvim" },
})
require("fidget").setup()

-- LSP keymaps in normal mode
vim.keymap.set("n", "gra", vim.lsp.buf.code_action, { desc = "[G]oto Code [A]ction" })
vim.keymap.set("n", "gri", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "grt", vim.lsp.buf.type_definition, { desc = "[G]oto [T]ype Definition" })
vim.keymap.set("n", "gO", vim.lsp.buf.document_symbol, { desc = "Open Document Symbols" })

-- Create default LSP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Enable snippet support in completion items
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Optional: add support for resolving extra details in completion items
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

-- ------------------------
-- Lua LSP
-- ------------------------
vim.lsp.config["lua_ls"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
		},
	},
	capabilities = capabilities, -- << apply capabilities
}
vim.lsp.enable("lua_ls")

-- ------------------------
-- Pyright (Python)
-- ------------------------
vim.lsp.config["pyright"] = {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", ".git" },
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
	capabilities = capabilities, -- << apply capabilities
}
vim.lsp.enable("pyright")

-- ------------------------
-- clangd (C/C++)
-- ------------------------
vim.lsp.config["clangd"] = {
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
	settings = {
		clangd = {
			completion = { detailedLabel = true },
			indexing = { background = true },
		},
	},
	capabilities = capabilities, -- << apply capabilities
}
vim.lsp.enable("clangd")
