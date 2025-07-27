vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy", {
	checker = {
		enabled = true,
		concurrency = 4,
		notify = true,
		frequency = 3600,
	},
})

vim.opt.number = true
vim.opt.relativenumber = true

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = "if_many",
    spacing = 1,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})

