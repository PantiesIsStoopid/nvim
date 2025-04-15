vim.api.nvim_set_hl(0, "DiagnosticSignError", {})
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", {})
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", {})
vim.api.nvim_set_hl(0, "DiagnosticSignHint", {})

for _, Type in ipairs({ "Error", "Warn", "Info", "Hint" }) do
  vim.fn.sign_define("DiagnosticSign" .. Type, { text = "", texthl = "None", numhl = "" })
end

