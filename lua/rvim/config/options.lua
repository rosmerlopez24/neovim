-- This file is automatically loaded.

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.autowrite = true
vim.o.conceallevel = 2
vim.o.confirm = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.inccommand = "nosplit"
vim.o.laststatus = 0
vim.o.linebreak = true
vim.o.list = true
vim.o.mouse = ""
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = false
vim.o.scrolloff = 4
vim.o.statusline = " "
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.o.showmode = false
vim.o.sidescrolloff = 4
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitkeep = "screen"
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.timeoutlen = 300
vim.o.updatetime = 250
vim.o.virtualedit = "block"
vim.o.wildmode = "longest:full,full"
vim.o.wrap = false
vim.o.shadafile = "NONE"
vim.o.swapfile = false

vim.schedule(function()
  vim.o.clipboard = "unnamedplus" -- Sync Neovim clipboard with the system clipboard
  vim.o.shell = "/bin/zsh" -- Set zsh as the default shell for external commands
end)

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
