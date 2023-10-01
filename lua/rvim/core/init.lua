---@class M
---@type table
local M = {}

---@class Config
local defaults = {
  -- General settings
  -- Border Win
  -- See :h nvim_open_win for possible border options
  ---@type string
  border = "rounded",
  -- Colorscheme and style
  -- Options: "catppuccin", "material", "nord", "onedark", "tokyonight"
  ---@type string
  colorscheme = "material",
  -- Only applies to the following color schemes
  -- catppuccin: latte, frappe, macchiato, mocha
  -- material: darker, lighter, oceanic, palenight, deep ocean
  -- tokyonight: storm, moon, night, day
  -- bluloco: dark, light
  ---@type string
  style = "deep ocean",

  -- Treesitter - Syntax highlighting
  -- See https://github.com/nvim-treesitter/nvim-treesitter
  ---@type table
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
  ---@type table
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
  ---@type table
  servers = {},
}

---@type function
function M.setup()
  ---@type Config
  Config = vim.deepcopy(defaults)

  -- Try load user config based on default config
  local present, _ = pcall(require, "rvim.config")
  if not present then
    vim.notify("Don't loaded user config!", vim.log.levels.INFO)
  end

  -- Setup global options
  require("rvim.core.options")
  -- Setup global autocommands
  require("rvim.core.autocmds")
  -- Setup global keymaps
  require("rvim.core.keymaps")
  -- Setup plugins manager
  require("rvim.core.lazy")

  -- Setup colorscheme
  require("lazy.core.util").try(function()
    if Config.colorscheme == "material" then
      vim.g.material_style = Config.style
    end
    vim.cmd.colorscheme(Config.colorscheme)
  end, {
    msg = "Could not load your colorscheme",
    on_error = function(msg)
      require("lazy.core.util").error(msg)
      vim.cmd.colorscheme("habamax")
    end,
  })
end

return M
