return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "super-tab" },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = true, window = { border = "rounded" } },
			menu = {
				border = "rounded",
				winblend = 10, -- slight transparency
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		-- Better suggestion ranking
		matching = {
			disallow_fuzzy_matching = false,
			disallow_partial_matching = false,
			disallow_prefix_unmatching = false,
		},
		sorting = {
			comparators = {
				"score", -- relevance score
				"locality", -- prefer nearby words
				"recency", -- recently used
				"kind", -- function/variable/etc
				"length", -- shorter matches first
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},

	opts_extend = { "sources.default" },
}
