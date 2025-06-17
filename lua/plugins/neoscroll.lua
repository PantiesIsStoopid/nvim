return {
	"karb94/neoscroll.nvim",
	event = "WinScrolled",
	config = function()
		require("neoscroll").setup({
			mappings = { "<C-u>", "<C-d>", "zz", "zt", "zb" },
			hide_cursor = true,
			stop_eof = true,
			respect_scrolloff = false,
			cursor_scrolls_alone = true,
			easing_function = "quadratic",
		})

		-- No toggle function, always enabled
	end,
}
