return {
  -- A blazing fast and easy to configure Neovim statusline.
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "BufReadPost",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        theme = rvim.config.colorscheme,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        globalstatus = vim.o.laststatus == 3,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = rvim.config.icons.diagnostics.Error,
              warn = rvim.config.icons.diagnostics.Warn,
              info = rvim.config.icons.diagnostics.Info,
              hint = rvim.config.icons.diagnostics.Hint,
            },
            always_visible = true,
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, separator = "", padding = { left = 0, right = 1 } },
        },
        lualine_x = {
          {
            "diff",
            symbols = {
              added = rvim.config.icons.git.added,
              modified = rvim.config.icons.git.modified,
              removed = rvim.config.icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          { "encoding" },
          { "fileformat" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "lazy", "oil" },
    },
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },

  -- blink.indent provides indent guides with scope on every keystroke (0.1-1ms per render)
  {
    "saghen/blink.indent",
    lazy = true,
    event = "BufReadPost",
    --- @module 'blink.indent'
    --- @type blink.indent.Config
    opts = {
      dedent_scoped_filetypes = { include_defaults = true },
      blocked = {
        buftypes = { include_defaults = true },
        filetypes = { include_defaults = true },
      },
      mappings = {
        border = "both",
        object_scope = "ii",
        object_scope_with_border = "ai",
        goto_top = "[i",
        goto_bottom = "]i",
      },
      static = {
        enabled = true,
        char = "▎",
        whitespace_char = nil,
        priority = 1,
        highlights = { "BlinkIndent" },
      },
      scope = {
        enabled = true,
        indent_at_cursor = false,
        char = "▎",
        priority = 1000,
        highlights = { "BlinkIndentViolet" },
        underline = { enabled = true, highlights = { "BlinkIndentVioletUnderline" } },
      },
    },
  },

  -- A Lua fork of vim-devicons.
  { "nvim-tree/nvim-web-devicons", lazy = true, opts = {} },
}
