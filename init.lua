-- Basic Vim settings
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1
vim.opt.cursorline = true

-- Disable the mouse
vim.opt.mouse = ""

-- Get home directory in a portable way
local home = vim.loop.os_homedir() or os.getenv("HOME")

-- Persistent undo settings
vim.opt.undodir = home .. "/.local/share/nvim/undo"
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup("plugins")

-- Load custom keymaps
require("keymaps")

-- Copy yanks to system clipboard
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.fn.setreg("+", vim.fn.getreg('"'))
  end,
})

-- Diagnostic ignore system
local IgnoredCodes = {}

function ToggleIgnoreCode()
  local buf = vim.api.nvim_get_current_buf()
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diags = vim.diagnostic.get(buf, { lnum = line })

  if #diags == 0 then
    print("No diagnostics on this line")
    return
  end

  local code = diags[1].code or (diags[1].user_data and diags[1].user_data.lsp and diags[1].user_data.lsp.code)
  if not code then
    print("No diagnostic code available to ignore")
    return
  end

  IgnoredCodes[code] = not IgnoredCodes[code]
  print((IgnoredCodes[code] and "Ignoring" or "Unignoring") .. " diagnostic code: " .. tostring(code))

  -- Refresh diagnostics
  vim.diagnostic.reset(nil, buf)
  vim.lsp.buf.clear_references()
  vim.lsp.buf_request_all(buf, "textDocument/publishDiagnostics", {}, function() end)
end

-- Filter diagnostics based on ignored codes
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Intercept diagnostics to filter ignored codes
local orig_handler = vim.diagnostic.handlers.virtual_text
vim.diagnostic.handlers.virtual_text = {
  show = function(ns, bufnr, diagnostics, opts)
    local filtered = {}
    for _, diag in ipairs(diagnostics) do
      local code = diag.code or (diag.user_data and diag.user_data.lsp and diag.user_data.lsp.code)
      if not (code and IgnoredCodes[code]) then
        table.insert(filtered, diag)
      end
    end
    orig_handler.show(ns, bufnr, filtered, opts)
  end,
  hide = orig_handler.hide,
}

vim.keymap.set("n", "<leader>ei", ToggleIgnoreCode, { desc = "Ignore current error code for session" })

