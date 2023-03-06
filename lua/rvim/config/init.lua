local M = {}

M.default_config = {
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
  -- onedark:  dark, darker, cool, deep, warm, warmer, light
  -- tokyonight: storm, moon, night, day
  style = "deep ocean",

  -- Plugins settings
  plugins = {
    -- Treesitter - Syntax highlighting
    -- See https://github.com/nvim-treesitter/nvim-treesitter
    treesitter = {
      -- A list of parser names, or "all"
      ensure_installed = {},
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
      -- List of parsers to ignore installing (for "all")
      ignore_install = {},

      highlight = {
        -- `false` will disable the whole extension
        enable = true,
        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = {},
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
    },
  },

  -- Icons for some plugins
  icons = {
    diagnostics = {
      Error = "󰅙 ",
      Warn = " ",
      Hint = "󰌵",
      Info = " ",
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
  ---@type lspconfig.options
  servers = {},
}

function M.setup()
  _G.config = vim.deepcopy(M.default_config)

  local present, _ = pcall(require, "config")
  if not present then
    vim.notify("Custom settings file isn't exists", vim.log.levels.INFO)
  end

  -- Setup global options
  require("rvim.config.options")
  -- Setup autocommands
  require("rvim.config.autocmds")
  -- Setup global keymaps
  require("rvim.config.keymaps")
  -- Setup plugins manager
  require("rvim.config.lazy")
end

return M
