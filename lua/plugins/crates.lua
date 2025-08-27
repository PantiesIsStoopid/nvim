return {
	{
		"saecki/crates.nvim",
		tag = "v0.3.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufRead Cargo.toml" },
		config = function()
			local crates = require("crates")
			crates.setup({
				null_ls = { enabled = true, name = "crates.nvim" },
			})

			-- Keymaps for crates.nvim
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<leader>ct", crates.toggle, opts)
			vim.keymap.set("n", "<leader>cr", crates.reload, opts)
			vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, opts)
			vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opts)
			vim.keymap.set("n", "<leader>cu", crates.update_crate, opts)
			vim.keymap.set("v", "<leader>cu", crates.update_crates, opts)
			vim.keymap.set("n", "<leader>ca", crates.update_all_crates, opts)
		end,
	},
}
