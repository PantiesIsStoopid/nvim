vim.loader.enable()
vim.opt.clipboard = "unnamedplus"
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"

local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"

for path, _ in vim.fs.dir(plugin_dir, { depth = math.huge }) do
	if path:sub(-4) == ".lua" then
		local mod = "plugins." .. path:gsub("%.lua$", ""):gsub("/", ".")
		require(mod)
	end
end
