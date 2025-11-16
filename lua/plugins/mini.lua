return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		-- Load only the modules you need, each separately:
		require("mini.git").setup()
		require("mini.statusline").setup()
		-- add more modules if needed:
		-- require("mini.basics").setup()
		-- require("mini.surround").setup()
		-- etc.
	end,
}
