-- This file is automatically loaded.
-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out =
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)
vim.o.loadplugins = true

-- Setup configurations
require("lazy").setup({
  -- leave nil when passing the spec as the first argument to setup()
  spec = {
    { import = "rvim.plugins.coding" },
    { import = "rvim.plugins.colorscheme" },
    { import = "rvim.plugins.editor" },
    { import = "rvim.plugins.formatting" },
    { import = "rvim.plugins.lspconfig" },
    { import = "rvim.plugins.treesitter" },
    { import = "rvim.plugins.ui" },
  },
  pkg = { enabled = true },
  rocks = { enabled = false },
  ui = {
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = RVimOptions.border,
    icons = { loaded = "", not_loaded = "" },
  },
  custom_keys = {},
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
  performance = {
    cache = { enabled = true },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to includes in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        "2html_plugin",
        "bugreport",
        "compiler",
        "editorconfig",
        "ftplugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "man",
        "matchit",
        "matchparen",
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        "netrwSettings",
        "optwin",
        "osc52",
        "rplugin",
        "rrhelper",
        "shada",
        "spellfile",
        "spellfile_plugin",
        "synmenu",
        "syntax",
        "tar",
        "tarPlugin",
        "tohtml",
        "tutor",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
      },
    },
  },
})
