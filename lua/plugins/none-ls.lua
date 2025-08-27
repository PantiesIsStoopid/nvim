return {
  "nvimtools/none-ls.nvim",
  config = function()
    local nonels = require("null-ls")
    local FormatGroup = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })

    nonels.setup({
      sources = {
        nonels.builtins.formatting.stylua,
        nonels.builtins.formatting.prettier,
        nonels.builtins.formatting.rustfmt,
        nonels.builtins.formatting.clang_format,
        nonels.builtins.formatting.black,
        nonels.builtins.formatting.isort,
      },

      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = FormatGroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = FormatGroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
