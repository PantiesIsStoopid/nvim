return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		require("ufo").setup({
			provider_selector = function(_, _, _)
				return { "treesitter", "indent" }
			end,
		})

		-- Simple manual toggle for current line
		vim.keymap.set("n", "<leader>ft", function()
			local lnum = vim.api.nvim_win_get_cursor(0)[1]
			if vim.fn.foldclosed(lnum) ~= -1 then
				vim.cmd("normal! zo")
			else
				vim.cmd("normal! zc")
			end
		end, { desc = "[F]olding [T]oggle" })
	end,
}
