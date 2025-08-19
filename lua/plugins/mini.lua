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
		vim.keymap.set("n", "<Leader>/", function()
			Comment.comment_line()
		end)
	end,
}
