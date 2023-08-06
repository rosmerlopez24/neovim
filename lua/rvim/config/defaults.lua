---@class RVConfig
local defaults = {
  -- General settings
  -- Border Win
  -- See :h nvim_open_win for possible border options
  border = "rounded",
  -- Colorscheme and style
  -- Options: "catppuccin", "material", "nord", "onedark", "tokyonight"
  colorscheme = "material",
  -- Only applies to the following color schemes
  -- catppuccin: latte, frappe, macchiato, mocha
  -- material: darker, lighter, oceanic, palenight, deep ocean
  -- tokyonight: storm, moon, night, day
  -- bluloco: dark, light
  style = "deep ocean",

  -- Treesitter - Syntax highlighting
  -- See https://github.com/nvim-treesitter/nvim-treesitter
  plugins = {
    treesitter = {
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = {},
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,
      -- List of parsers to ignore installing (for "all")
      ignore_install = {},
    },
  },

  -- Icons for some plugins
  icons = {
    diagnostics = {
      Error = " ",
      Warn = " ",
      Info = " ",
      Hint = " ",
    },
    git = {
      added = " ",
      modified = " ",
      removed = " ",
    },
    kinds = {
      Array = " ",
      Boolean = " ",
      Class = " ",
      Color = " ",
      Constant = " ",
      Constructor = " ",
      Enum = " ",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = " ",
      Interface = " ",
      Key = " ",
      Keyword = " ",
      Method = " ",
      Module = " ",
      Namespace = " ",
      Null = "ﳠ ",
      Number = " ",
      Object = " ",
      Operator = " ",
      Package = " ",
      Property = " ",
      Reference = " ",
      Snippet = " ",
      String = " ",
      Struct = " ",
      Text = " ",
      TypeParameter = " ",
      Unit = " ",
      Value = " ",
      Variable = " ",
    },
  },

  -- LSP Server Settings
  servers = {},
}

return defaults
