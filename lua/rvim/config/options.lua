-- This file is automatically loaded.

-- Reset the package path to improve startup time
vim.go.packpath = vim.env.VIMRUNTIME

-- Reset the runtime path to $VIMRUNTIME and your config directory
---@type vim.Option
---@diagnostic disable-next-line
vim.opt.rtp = {
  vim.fn.stdpath("config"),
  vim.fn.stdpath("data") .. "/site",
  vim.env.VIMRUNTIME,
  vim.fn.stdpath("config") .. "/after",
}

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable perl provider
vim.g.loaded_perl_provider = 0
-- Disable python 3 provider
vim.g.loaded_python3_provider = 0
-- Disable ruby provider
vim.g.loaded_ruby_provider = 0
-- Disable node provider
vim.g.loaded_node_provider = 0

-- Setup editor options
vim.o.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
vim.o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
vim.o.completeopt = "menu,menuone,noselect"
vim.o.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
vim.o.confirm = true -- Confirm to save changes before exiting modified buffer
vim.o.cursorline = true -- Enable highlighting of the current line
vim.o.expandtab = true -- Use spaces instead of tabs
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.o.foldlevel = 99
vim.o.formatoptions = "jcroqlnt" -- tcqj
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --vimgrep"
vim.o.ignorecase = true -- Ignore case
vim.o.inccommand = "nosplit" -- preview incremental substitute
vim.o.jumpoptions = "view"
vim.o.laststatus = 3 -- global statusline
vim.o.linebreak = true -- Wrap lines at convenient points
vim.o.list = true -- Show some invisible characters (tabs...
vim.o.mouse = "" -- Disable mouse mode
vim.o.number = true -- Print line number
vim.o.pumblend = 10 -- Popup blend
vim.o.pumheight = 10 -- Maximum number of entries in a popup
vim.o.relativenumber = true -- Relative line numbers
vim.o.ruler = false -- Disable the default ruler
vim.o.scrolloff = 4 -- Lines of context
vim.opt.sessionoptions =
  { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.o.shiftround = true -- Round indent
vim.o.shiftwidth = 2 -- Size of an indent
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.o.showmode = false -- Dont show mode since we have a statusline
vim.o.sidescrolloff = 8 -- Columns of context
vim.o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.smartcase = true -- Don't ignore case with capitals
vim.o.smartindent = true -- Insert indents automatically
vim.o.splitbelow = true -- Put new windows below current
vim.o.splitkeep = "screen"
vim.o.splitright = true -- Put new windows right of current
vim.o.tabstop = 2 -- Number of spaces tabs count for
vim.o.termguicolors = true -- True color support
vim.o.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.updatetime = 200 -- Save swap file and trigger CursorHold
vim.o.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.o.wildmode = "longest:full,full" -- Command-line completion mode
vim.o.winminwidth = 5 -- Minimum window width
vim.o.wrap = false -- Disable line wrap
vim.o.shadafile = "NONE" -- Disable shadafile
vim.o.shell = "/bin/zsh" -- Set shell
vim.o.swapfile = false -- Disable swapfile

if vim.fn.has("nvim-0.10") == 1 then
  vim.o.smoothscroll = true
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
