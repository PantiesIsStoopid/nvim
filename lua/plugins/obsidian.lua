return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended
  ft = "markdown",
  enabled = function()
    return vim.fn.isdirectory(".obsidian") == 1
  end,
  opts = {
    workspaces = {
      {
        name = "Notes",
        path = "~/Desktop/Notes/",
      },
    },
  },
}
