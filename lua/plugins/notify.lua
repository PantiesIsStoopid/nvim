return {
	"rcarriga/nvim-notify",
	opts = {
		background_colour = "#282c34", -- One Dark Pro background
		stages = "slide",
		timeout = 3000,
		render = "default",
		border = "rounded",
	},
	config = function(_, opts)
		require("notify").setup(opts)
		vim.notify = require("notify")
	end,
}
