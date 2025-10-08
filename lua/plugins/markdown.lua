return {
	{
		"iamcco/markdown-preview.nvim",
		event = "FileType markdown",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		{
			"MeanderingProgrammer/render-markdown.nvim",
			event = "FileType markdown",
			dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
			---@module 'render-markdown'
			---@type render.md.UserConfig
			opts = {},
		},
	},
}
