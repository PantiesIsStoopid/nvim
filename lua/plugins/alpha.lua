return {
  "goolord/alpha-nvim",
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
      Dashboard.button("f", "󰱼  Find File", ":Telescope find_files<CR>"),
      Dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
      Dashboard.button("s", "  Search Text", ":Telescope live_grep<CR>"),
      Dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
      Dashboard.button("l", "󰒲  Lazy Update", ":Lazy update<CR>"),
      Dashboard.button("q", "󰈆  Quit", ":qa<CR>"),
    }

    -- Footer with Lazy.nvim stats
    Dashboard.section.footer.val = function()
      local EndTime = vim.loop.hrtime()
      local TotalTime = math.floor((EndTime - vim.g.startup_time) / 1e6) -- in ms
      local Stats = require("lazy").stats()
      return string.format(
        "⚡ Startup Time: %dms  |  %d/%d Plugins Loaded",
        TotalTime,
        Stats.loaded,
        Stats.count
      )
    end

    -- Setup
    Alpha.setup(Dashboard.opts)
  end,
}
