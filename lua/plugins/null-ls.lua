return {
    "nvimtools/none-ls.nvim",
    config = function()
        local nullls = require("null-ls")

        nullls.setup({
            sources = { -- Formatting
            nullls.builtins.formatting.stylua, -- Lua
            nullls.builtins.formatting.prettier, -- JS, CSS, HTML, etc
            nullls.builtins.formatting.clang_format -- C, C++
            }
        })

        vim.keymap.set("n", "<leader>qf", function()
            vim.lsp.buf.format({
                async = true
            })
        end, {})
    end
}

