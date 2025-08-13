return {{
    "mason-org/mason.nvim",
    opts = {}
}, {
    "neovim/nvim-lspconfig",
    config = function()
        local LspConfig = require("lspconfig")

        -- Keymap to format buffer manually
        vim.keymap.set("n", "<leader>qf", vim.lsp.buf.format)

        -- Auto-format on save if the client supports formatting
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local Client = vim.lsp.get_client_by_id(args.data.client_id)
                if not Client then
                    return
                end

                if Client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({
                                async = true,
                                bufnr = args.buf,
                                id = Client.id
                            })
                        end
                    })
                end
            end
        })

        -- Common keymaps for LSP
        local OnAttach = function(_, BufNr)
            local Opts = {
                noremap = true,
                silent = true,
                buffer = BufNr
            }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, Opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, Opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, Opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, Opts)
        end

        -- Setup Lua LSP
        LspConfig.lua_ls.setup({
            on_attach = OnAttach,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT"
                    },
                    diagnostics = {
                        globals = {"vim"}
                    },
                    workspace = {
                        library = {
                            [vim.fn.stdpath("data") .. "/lazy/lazydev.nvim/luv/library"] = true
                        }
                    },
                    telemetry = {
                        enable = false
                    }
                }
            }
        })
    end
}, {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
        library = {
            path = vim.fn.stdpath("data") .. "/lazy/lazydev.nvim/luv/library",
            words = {"vim%.uv"}
        }
    }
}}
