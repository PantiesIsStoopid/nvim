vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  {
    src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },
  { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons", cond = vim.g.have_nerd_font },
})

local function setup_telescope()
  local ok, telescope = pcall(require, "telescope")
  if not ok then return end

  telescope.setup({
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown(),
      },
    },
  })

  pcall(telescope.load_extension, "fzf")
  pcall(telescope.load_extension, "ui-select")

  local builtin = require("telescope.builtin")

  -- Keymaps
  local map = vim.keymap.set
  map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
  map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
  map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
  map("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
  map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
  map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
  map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
  map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
  map("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
  map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

  map("n", "<leader>/", function()
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
      winblend = 10,
      previewer = false,
    }))
  end, { desc = "[/] Fuzzily search in current buffer" })

  map("n", "<leader>s/", function()
    builtin.live_grep({
      grep_open_files = true,
      prompt_title = "Live Grep in Open Files",
    })
  end, { desc = "[S]earch [/] in Open Files" })

  map("n", "<leader>sn", function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
  end, { desc = "[S]earch [N]eovim files" })
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = setup_telescope,
  desc = "Setup telescope.nvim",
})
