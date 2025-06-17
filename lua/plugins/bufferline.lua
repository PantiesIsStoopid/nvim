return {
	"akinsho/bufferline.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				numbers = "none", -- Change to 'ordinal', 'buffer_id', or 'both'
				close_command = "bdelete! %d", -- Close buffer command
				right_mouse_command = "bdelete! %d", -- Right-click close
				left_mouse_command = "buffer %d", -- Left-click buffer
				indicator = {
					icon = "▎", -- Indicator icon
					style = "icon",
				},
				buffer_close_icon = "x", -- Close icon
				modified_icon = "", -- Modified icon
				close_icon = "x", -- Close icon
				left_trunc_marker = "", -- Left truncation
				right_trunc_marker = "", -- Right truncation
				max_name_length = 18, -- Max buffer name length
				max_prefix_length = 15, -- Max prefix length
				tab_size = 18, -- Tab size
				diagnostics = false, -- Diagnostics visibility
				diagnostics_update_in_insert = false,
				offsets = {
					{ filetype = "NvimTree", text = "File Explorer", text_align = "center" },
				},
				color_icons = true, -- Enable colored icons
			},
		})
	end,
}
