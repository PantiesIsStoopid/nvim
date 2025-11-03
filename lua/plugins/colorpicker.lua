return {
	"norcalli/nvim-colorizer.lua",
	lazy = true,
	config = function()
		local colorizer = require("colorizer")

		colorizer.setup({
			"*", -- enable for all buffers
			css = { rgb_fn = true }, -- enable rgb()/rgba() parsing
			html = { mode = "foreground" }, -- show color as text color in HTML
		}, {
			mode = "background", -- default preview mode
			names = true, -- enable color name parsing
		})

		-- Enable colorizer globally (auto-attach to all buffers)
		vim.cmd("ColorizerAttachToBuffer")
	end,
}
