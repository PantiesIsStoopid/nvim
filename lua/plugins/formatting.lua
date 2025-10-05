return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fb",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat [B]uffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = {}
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			arduino = { "clang-format" },
			cmake = { "cmake-format" },
			css = { "prettier" },
			dockerfile = { "hadolint" },
			go = { "goimports" },
			html = { "prettier" },
			json = { "prettier" },
			java = { "google-java-format" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			jq = {}, -- no formatter
			julia = { "JuliaFormatter" },
			kotlin = { "ktlint" },
			yaml = { "prettier" },
			toml = { "taplo" },
			latex = { "latexindent" },
			lua = { "stylua" },
			make = {}, -- no formatter
			markdown = { "prettier" },
			matlab = { "matlab-language-server" },
			mermaid = { "mmdc" },
			php = { "php-cs-fixer" },
			powershell = { "powershell-formatter" },
			python = { "isort", "black" },
			zsh = { "shfmt" },
		},
	},
}
