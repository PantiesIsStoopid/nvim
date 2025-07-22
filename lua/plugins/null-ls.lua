return {
    "nvimtools/none-ls.nvim",
    config = function()
        local nullls = require("null-ls")

        nullls.setup({
            sources = { -- Formatting
            nullls.builtins.formatting.stylua, nullls.builtins.formatting.prettier,
            nullls.builtins.formatting.clang_format, nullls.builtins.formatting.black}
        })

        vim.keymap.set("n", "<leader>qf", function()
            vim.lsp.buf.format({
                async = true
            })
        end, {})
    end
}

