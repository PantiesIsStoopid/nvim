return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"},
    lazy = false,
    opts = {
        filesystem = {
            filtered_items = {
                visible = true, -- show hidden files
                hide_dotfiles = false
            }
        }
    },
    keys = {{
        "<C-b>",
        "<cmd>Neotree toggle<cr>",
        desc = "Toggle Neo-tree"
    }}
}
