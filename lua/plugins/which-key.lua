return {
	"folke/which-key.nvim",
	opts = {},

	-- disable all native presets
	plugins = {
		presets = {
			operators = false,
			motions = false,
			text_objects = false,
			windows = false,
			nav = false,
			z = false,
			g = false,
		},
	},

	spec = {
		-- Groups
		{ "<leader>s", group = "[S]earch" },
		{ "<leader>t", group = "[T]oggle" },
		{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },

		-- Formatter
		{ "<leader>f", name = "Format Buffer" },

		-- Terminal / Run
		{ "<leader>ft", name = "Floating Terminal" },
		{ "<F5>", name = "Run Code" },

		-- LSP
		{ "grn", name = "Rename" },
		{ "gra", name = "Code Action" },
		{ "grr", name = "References" },
		{ "gri", name = "Implementation" },
		{ "grd", name = "Definition" },
		{ "grD", name = "Declaration" },
		{ "grt", name = "Type Definition" },
		{ "<leader>th", name = "Toggle Inlay Hints" },

		-- Oil
		{ "-", name = "Open Parent Directory" },

		-- Telescope
		{ "<leader>sh", name = "Help" },
		{ "<leader>sk", name = "Keymaps" },
		{ "<leader>sf", name = "Files" },
		{ "<leader>ss", name = "Builtin Picker" },
		{ "<leader>sw", name = "Current Word" },
		{ "<leader>sg", name = "Live Grep" },
		{ "<leader>sd", name = "Diagnostics" },
		{ "<leader>sr", name = "Resume Picker" },
		{ "<leader>s.", name = "Recent Files" },
		{ "<leader><leader>", name = "Open Buffers" },
		{ "<leader>/", name = "Buffer Search" },
		{ "<leader>s/", name = "Live Grep Open Files" },
		{ "<leader>sn", name = "Neovim Config" },

		-- Trouble
		{ "<leader>xx", name = "Diagnostics" },
		{ "<leader>xX", name = "Buffer Diagnostics" },
		{ "<leader>xL", name = "Location List" },
		{ "<leader>xQ", name = "Quickfix List" },
		{ "<leader>cs", name = "Symbols" },
		{ "<leader>cl", name = "LSP Definitions/References" },

		-- Undo Tree
		{ "<leader>u", name = "Undo Tree" },

		-- Window management
		{ "<leader>sv", name = "Vertical Split" },
		{ "<leader>sh", name = "Horizontal Split" },

		-- Navigation (these can’t appear in which-key normally since they are Ctrl mappings, but you can still map them)
		-- <C-h>, <C-j>, <C-k>, <C-l> window movement
		-- Insert mode jk → <Esc>
	},
}
