vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.lazyredraw = true
vim.opt.mouse = ""

require("config.lazy")

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
