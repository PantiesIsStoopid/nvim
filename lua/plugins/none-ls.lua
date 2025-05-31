return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Formatters
				null_ls.builtins.formatting.stylua, -- Lua
				null_ls.builtins.formatting.prettier, -- HTML, CSS, JS
				null_ls.builtins.formatting.goimports, -- Go
				null_ls.builtins.formatting.black, -- Python
				null_ls.builtins.formatting.clang_format, -- C/C++
			},
		})

		vim.keymap.set("n", "<leader>qf", function()
			vim.lsp.buf.format({ async = true })
		end, { desc = "Format buffer with LSP" })
	end,
}
