return {

	"jbyuki/nabla.nvim",
	lazy = true,
	keys = {
		{ "<leader>ml", ':lua require("nabla").popup()<CR>', desc = "Preview LaTeX as ASCII" },
	},
}
