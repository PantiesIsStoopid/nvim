return {
	"norcalli/nvim-colorizer.lua",
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("colorizer").setup({
			"*",
			css = { rgb_fn = true },
			html = { names = false, mode = "foreground" },
		}, {
			mode = "background",
		})
	end,
}
