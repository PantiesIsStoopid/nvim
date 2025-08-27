return {
	"rcarriga/nvim-notify",
	lazy = true,
	-- lazy-load on first use of vim.notify
	init = function()
		vim.notify = function(...)
			require("notify").setup({
				background_colour = "#282c34",
				stages = "slide",
				timeout = 3000,
				render = "default",
				border = "rounded",
			})
			vim.notify = require("notify")
			return vim.notify(...)
		end
	end,
}
