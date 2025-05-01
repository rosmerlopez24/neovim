-- This file is automatically loaded.

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.go.autowrite = true
vim.go.conceallevel = 2
vim.go.confirm = true
vim.go.cursorline = true
vim.go.expandtab = true
vim.go.ignorecase = true
vim.go.inccommand = "nosplit"
vim.go.laststatus = 3
vim.go.linebreak = true
vim.go.list = true
vim.go.mouse = ""
vim.go.number = true
vim.go.relativenumber = true
vim.go.ruler = false
vim.go.scrolloff = 4
vim.go.shiftround = true
vim.go.shiftwidth = 2
vim.go.showmode = false
vim.go.sidescrolloff = 4
vim.go.signcolumn = "yes"
vim.go.smartcase = true
vim.go.smartindent = true
vim.go.splitbelow = true
vim.go.splitkeep = "screen"
vim.go.splitright = true
vim.go.tabstop = 2
vim.go.termguicolors = true
vim.go.timeoutlen = 300
vim.go.updatetime = 250
vim.go.virtualedit = "block"
vim.go.wildmode = "longest:full,full"
vim.go.wrap = false
vim.go.shadafile = "NONE"
vim.go.swapfile = false

vim.schedule(function()
  vim.go.clipboard = "unnamedplus" -- Sync Neovim clipboard with the system clipboard
  vim.go.shell = "/bin/zsh" -- Set zsh as the default shell for external commands
end)

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
