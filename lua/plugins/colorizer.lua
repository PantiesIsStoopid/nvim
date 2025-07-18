return {
	"norcalli/nvim-colorizer.lua",
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
