# Neovim Config Overview

## Plugins Included

These are the plugins included in your configuration:

**Navigation & UI**

- Lazy – Plugin manager
- Alpha – Start screen/dashboard
- Bufferline – Buffer tabs
- Telescope – Fuzzy finder for files, buffers, grep
- Oil – Directory navigation

**Code Tools**

- Conform – Code formatting
- LSP – Language Server Protocol support
- Treesitter – Syntax highlighting and parsing
- Mini – Utility functions

**Git**

- Gitsigns – Git integration
- Diffview – Git diffs

**Appearance**

- OneDark Pro – Colour scheme/theme

**Other**

- MarkdownPreview – Preview Markdown files
- WhichKey – Keybinding popup

---

## Keybinds & What They Do

**Diagnostics & Formatting**

- `<leader>q` – Opens diagnostic quickfix list
- `<leader>f` – Formats the current buffer using Conform

**Diffview**

- `<leader>dv` – Opens Diffview for git diffs

**LSP (Language Server)**

- `K` – Show hover documentation for symbol under cursor
- `grn` – Rename the symbol under cursor
- `gra` – Open code actions
- `grr` – Show references using Telescope
- `gri` – Go to implementations using Telescope
- `grd` – Go to definition using Telescope
- `grD` – Go to declaration
- `gO` – Show document symbols
- `gW` – Show workspace symbols
- `grt` – Go to type definition

**Commenting**

- `gcc` – Comment or uncomment the current line or in visual mode the selection

**Oil (Directory Navigation)**

- `-` – Open the parent directory

**Telescope**

- `<leader>ff` – Find files
- `<leader>fg` – Search text in project (live grep)
- `<leader>fb` – List open buffers
- `<leader>fh` – Search help tags

**Treesitter Incremental Selection**

- `<C-space>` – Initialize or increment selection
- `<C-s>` – Increment selection by scope
- `<M-space>` – Decrement selection

**WhichKey**

- `<leader>?` – Show buffer-local keymaps

---

## Useful Commands Without Keybinds

- `:MarkdownPreview` – Preview current Markdown file in browser
- `:Gitsigns toggle_current_line_blame` – Show git blame for current line
- `:DiffviewOpen` / `:DiffviewClose` – Open/close Diffview
- `:LspInfo` – Show LSP server info
- `:LspRestart` – Restart LSP server
