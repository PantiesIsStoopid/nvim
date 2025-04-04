# Neovim Configuration Documentation

## Overview
This Neovim setup is built using **Lazy.nvim** for plugin management. It includes:
- **Catppuccin** theme for aesthetics
- **GitHub Copilot** for AI-powered suggestions
- **Gitsigns** for Git status indicators and operations
- **Neotree** for file navigation
- **Telescope** for fuzzy finding and searching
- **Treesitter** for syntax highlighting
- **LSP (Language Server Protocol)** for enhanced coding features

## Keybindings
- `Ctrl + B` → Opens **Neotree**
- `Space + ff` → Opens **FZF** for file search
- `Space + fg` → Opens **Grep** for text search
- `Ctrl + L` → Toggles **line numbers**
- `Ctrl + S` → Formats **the current document**
- `Ctrl + D` → Hides/shows **line-by-line diagnostics**

## Plugin Configuration
### Lazy.nvim Setup
Lazy.nvim is used to manage all plugins efficiently. Ensure Lazy is installed before proceeding.

### Plugins List
```lua
return {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 'github/copilot.vim' },
  { 'lewis6991/gitsigns.nvim' },
  { 'nvim-neo-tree/neo-tree.nvim' },
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  { 'neovim/nvim-lspconfig' },
}
```

### Keybindings Configuration
```lua
vim.api.nvim_set_keymap('n', '<C-b>', ':Neotree toggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':set relativenumber! number!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', ':lua vim.diagnostic.hide(nil, 0) or vim.diagnostic.show(nil, 0)<CR>', { noremap = true, silent = true })
```

## Installation Steps
1. Install **Neovim** (latest version recommended)
2. Install **Lazy.nvim**
3. Add the plugin list to your Neovim configuration
4. Restart Neovim and run `:Lazy sync` to install plugins

## Additional Features
- **LSP Support**: Preconfigured with **nvim-lspconfig** for autocompletion, linting, and formatting.
- **Treesitter**: Ensures better syntax highlighting and code understanding.
- **Git Integration**: With **Gitsigns**, view changes, hunks, and perform Git operations inside Neovim.

---
This setup ensures a smooth and efficient development experience with **Neovim**.



