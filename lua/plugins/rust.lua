return {
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = true, -- This plugin is already lazy
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup()
		end,
	},
}
