return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		local Alpha = require("alpha")
		local Dashboard = require("alpha.themes.dashboard")

		-- Header ASCII
		Dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}
		-- Buttons
		Dashboard.section.buttons.val = {
			Dashboard.button("q", "󰈆  Quit", ":qa<CR>"),
		}

		-- Footer with Lazy.nvim stats
		Dashboard.section.footer.val = function()
			local EndTime = vim.loop.hrtime()
			local TotalTime = math.floor((EndTime - vim.g.startup_time) / 1e6) -- ms
			local Stats = require("lazy").stats()
			local Loaded = Stats.loaded
			local Total = Stats.count
			return "⚡ Startup Time: " .. TotalTime .. "ms  |  " .. Loaded .. "/" .. Total .. " Plugins Loaded"
		end

		Alpha.setup(Dashboard.opts)
	end,
}
