return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.pairs").setup()
		require("mini.surround").setup()
		require("mini.statusline").setup()
		require("mini.comment").setup()
		require("mini.completion").setup()
		require("mini.snippets").setup()
		require("mini.git").setup()

		local Comment = require("mini.comment")

		-- Mini Comment keymaps
		vim.keymap.set("n", "<Leader>/", Comment.comment_line)
		vim.keymap.set("v", "<Leader>/", function()
			Comment.comment_lines()
		end)
	end,
}
