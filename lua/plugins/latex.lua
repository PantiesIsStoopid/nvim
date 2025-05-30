return {
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.Vimtex_View_Method = "general"
			vim.g.Vimtex_View_General_Viewer = "start"

			vim.keymap.set("n", "<leader>mc", function()
				vim.cmd("write")
				local TexFile = vim.fn.expand("%")
				local PdfFile = vim.fn.expand("%:r") .. ".pdf"
				vim.fn.jobstart({ "cmd.exe", "/c", "pdflatex", TexFile .. ' && start "" "' .. PdfFile .. '"' })
			end, { desc = "Compile and open PDF with pdflatex and Windows viewer" })

			-- Auto-compile and open PDF on save
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = "*.tex",
				callback = function()
					local TexFile = vim.fn.expand("%")
					vim.fn.jobstart({ "cmd.exe", "/c", "pdflatex", TexFile })
					-- no 'start' command here, so no new window opens
				end,
			})
		end,
	},

	{
		"jbyuki/nabla.nvim",
		lazy = true,
		keys = {
			{ "<leader>ml", ':lua require("nabla").popup()<CR>', desc = "Preview LaTeX as ASCII" },
		},
	},
}
