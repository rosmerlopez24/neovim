# rvim — Personal Neovim Configuration

A modular, lightweight Neovim configuration written entirely in Lua.

## Requirements

- Neovim >= **0.12.0** (LuaJIT)
- Git >= **2.19.0**
- Nerd Font (recommended for icons)

## Project Structure

```
~/.config/nvim
├── init.lua              # Entry point
├── lua/rvim/
│   ├── config/           # Core setup
│   │   ├── init.lua      # Default options & setup orchestrator
│   │   ├── options.lua   # Editor options
│   │   ├── keymaps.lua   # Key mappings
│   │   ├── autocmds.lua  # Autocommands
│   │   └── lazy.lua      # lazy.nvim bootstrap & plugin spec
│   ├── plugins/          # Plugin specs organized by category
│   │   ├── coding.lua    # blink.cmp, lazydev.nvim
│   │   ├── colorscheme.lua
│   │   ├── editor.lua    # oil.nvim, gitsigns.nvim
│   │   ├── formatting.lua
│   │   ├── treesitter.lua
│   │   └── ui.lua        # lualine.nvim, blink.indent
│   └── util/
│       ├── init.lua      # Lazy-loader for utilities
│       ├── lsp.lua       # LSP attach config & diagnostics
│       └── bufdelete.lua # Buffer deletion preserving window layout
├── lsp/                  # LSP server configs
│   ├── lua_ls.lua
│   ├── ruff.lua
│   └── ty.lua
└── stylua.toml           # StyLua formatter config
```

## Plugins

| Plugin | Purpose |
|---|---|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Colorscheme |
| [blink.cmp](https://github.com/Saghen/blink.cmp) | Completion engine |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim) | LuaLS workspace config |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting & indentation |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File explorer |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Code formatting |
| [blink.indent](https://github.com/Saghen/blink.indent) | Indent guides |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet collection |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File icons |

## LSP Servers

- **lua_ls** — Lua (with lazydev integration)
- **ruff** — Python linting & formatting
- **ty** — Python type checking

## Keymaps

| Key | Action |
|---|---|
| `<leader>s` | Save file |
| `<leader>q` | Open diagnostic quickfix list |
| `<leader>bd` | Delete buffer (preserves layout) |
| `<leader>bo` | Delete other buffers |
| `<leader>bD` | Delete buffer and window |
| `<leader>qq` | Quit all |
| `<leader>th` | Toggle inlay hints |
| `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `<C-h/j/k/l>` | Navigate windows |
| `<A-j/k>` | Move lines up/down |
| `gra` | Code action |
| `grr` | References |
| `gri` | Implementation |
| `grd` | Definition |
| `K` | Hover documentation |
| `gK` | Signature help |

## Customization

Create `lua/rvim/rvimrc.lua` to override defaults. See `lua/rvim/config/init.lua` for available options.

## Credits

- [NvChad](https://github.com/NvChad/NvChad)
- [LazyVim](https://github.com/LazyVim/LazyVim)
- [LunarVim](https://github.com/LunarVim/LunarVim)
- [AstroVim](https://github.com/AstroNvim/AstroNvim)
