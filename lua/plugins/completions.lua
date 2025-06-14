return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local Cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			Cmp.setup({
				snippet = {
					expand = function(Args)
						require("luasnip").lsp_expand(Args.body)
					end,
				},
				window = {
					completion = Cmp.config.window.bordered(),
					documentation = Cmp.config.window.bordered(),
				},
				mapping = Cmp.mapping.preset.insert({
					["<C-b>"] = Cmp.mapping.scroll_docs(-4, { desc = "Scroll documentation up" }),
					["<C-f>"] = Cmp.mapping.scroll_docs(4, { desc = "Scroll documentation down" }),
					["<C-Space>"] = Cmp.mapping.complete({ desc = "Trigger completion menu" }),
					["<C-e>"] = Cmp.mapping.abort({ desc = "Abort completion" }),
					["<CR>"] = Cmp.mapping.confirm({ select = true, desc = "Confirm completion selection" }),
				}),
				sources = Cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
