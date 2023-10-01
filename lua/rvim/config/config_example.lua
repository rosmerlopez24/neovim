-- General settings
-- Border Win
-- See :h nvim_open_win for possible border options
---
Config.border = "rounded"

-- Colorscheme and style
-- Options: "catppuccin", "material", "nord", "onedark", "tokyonight"
Config.colorscheme = "material"

-- Only applies to the following color schemes
-- catppuccin: latte, frappe, macchiato, mocha
-- material: darker, lighter, oceanic, palenight, deep ocean
-- tokyonight: storm, moon, night, day
-- bluloco: dark, light
Config.style = "deep ocean"

-- Automatically install missing parsers when entering buffer
Config.plugins.treesitter.auto_install = false

-- List of parsers to ignore installing
Config.plugins.treesitter.ignore_install = {}

-- If you don't want all the parsers change this to a table of the ones you want
Config.plugins.treesitter.ensure_installed = { "lua", "luadoc", "vim", "vimdoc" }

-- LSP Servers Config
Config.servers.lua_ls = {
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
      completion = {
        callSnippet = "Replace",
      },
      format = {
        enable = false,
      },
    },
  },
}
