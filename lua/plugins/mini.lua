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
	end,
}
