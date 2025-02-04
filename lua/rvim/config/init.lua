---@class RVimConfig : RVimOptions
local M = {}

---@class RVimOptions
local defaults = {
  -- General settings
  -- Border Win
  -- See :h nvim_open_win for possible border options
  ---@class Border: string
  border = "none",
  -- Colorscheme
  -- Options: "catppuccin", "material", "nord", "onedark", "tokyonight", "bluloco", "rose-pine"
  ---@class Colorscheme: string
  colorscheme = "material",
  -- Only applies to the following color schemes
  -- bluloco: dark, light
  -- catppuccin: latte, frappe, macchiato, mocha
  -- material: darker, lighter, oceanic, palenight, deep ocean
  -- rose-pine: main, moon, dawn
  -- tokyonight: storm, moon, night, day
  -- nord: Not applicable
  -- onedark: dark, darker, cool, deep, warm, warmer, light
  --- Choose style
  ---@class Style: string
  style = "deep ocean",
  -- Treesitter - Syntax highlighting
  -- See https://github.com/nvim-treesitter/nvim-treesitter
  ---@type table
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
  -- Icons used by other plugins
  ---@class Icons: table
  icons = {
    diagnostics = {
      Error = " ",
      Hint = " ",
      Info = " ",
      Warn = " ",
    },
    git = {
      added = " ",
      modified = " ",
      removed = " ",
    },
    kinds = {
      Array = " ",
      Boolean = "󰨙 ",
      Class = " ",
      Codeium = "󰘦 ",
      Collapsed = " ",
      Color = " ",
      Constant = "󰏿 ",
      Constructor = " ",
      Control = " ",
      Copilot = " ",
      Enum = " ",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = "󰊕 ",
      Interface = " ",
      Key = " ",
      Keyword = " ",
      Method = "󰊕 ",
      Module = " ",
      Namespace = "󰦮 ",
      Null = " ",
      Number = "󰎠 ",
      Object = " ",
      Operator = " ",
      Package = " ",
      Property = " ",
      Reference = " ",
      Snippet = "󱄽 ",
      String = " ",
      Struct = "󰆼 ",
      Supermaven = " ",
      TabNine = "󰏚 ",
      Text = " ",
      TypeParameter = " ",
      Unit = " ",
      Value = " ",
      Variable = "󰀫 ",
    },
  },
  -- LSP Server Settings
  ---@type table
  servers = {
    lua_ls = {
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false,
          },
          codeLens = {
            enable = true,
          },
          completion = {
            callSnippet = "Replace",
          },
          doc = {
            privateName = { "^_" },
          },
          hint = {
            enable = false,
          },
          format = {
            enable = false,
          },
        },
      },
    },
  },
}

function M.setup()
  ---@class RVimOptions
  _G.RVimOptions = vim.deepcopy(defaults)

  -- Try load user config based on default config
  local present, _ = pcall(require, "rvim.rvimrc")
  if not present then
    vim.notify("Don't loaded user config!", vim.log.levels.INFO)
  end

  -- Setup global options
  require("rvim.config.options")
  -- Setup global autocommands
  require("rvim.config.autocmds")
  -- Setup global keymaps
  require("rvim.config.keymaps")
  -- Setup plugins manager
  require("rvim.config.lazy")

  -- Setup colorscheme
  if RVimOptions.colorscheme == "material" then
    vim.g.material_style = RVimOptions.style
  end
  vim.api.nvim_command("colorscheme " .. RVimOptions.colorscheme)
end

return M
