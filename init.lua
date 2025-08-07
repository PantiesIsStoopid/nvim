vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.lazyredraw = true
vim.opt.mouse = ""
vim.opt.termguicolors = true

require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true

local disabled_plugins = {
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "matchit",
  "matchparen",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
}

for _, plugin in ipairs(disabled_plugins) do
  vim.g["loaded_" .. plugin] = 1
end


vim.keymap.set("n", "<F5>", function()
  local Makefile = vim.fn.getcwd() .. "/Makefile"
  if vim.fn.filereadable(Makefile) == 1 then
    vim.cmd("!make")
  else
    print("No Makefile found in current directory.")
  end
end, { noremap = true, silent = true })
