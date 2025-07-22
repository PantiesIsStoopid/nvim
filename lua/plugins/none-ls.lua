return {
  "nvimtools/none-ls.nvim",
  config = function()
    local NullLs = require("null-ls")
    NullLs.setup({
      sources = {
        NullLs.builtins.formatting.stylua,
        NullLs.builtins.formatting.prettier,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = "LspFormatting", buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", {}),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })

    vim.keymap.set("n", "<leader>qf", vim.lsp.buf.format, { desc = "Format current buffer" })
  end,
}
