return {
  "nvim-lualine/lualine.nvim",
  lazy = true,
  opts = {
    options = {
      icons_enabled = true,
      theme = Config.colorscheme,
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      disabled_filetypes = { "NvimTree", "lazy" },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { { "mode", icon = "" } },
      lualine_b = { "branch" },
      lualine_c = {
        {
          "diagnostics",

          -- Table of diagnostic sources, available sources are:
          --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
          -- or a function that returns a table as such:
          --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
          sources = { "nvim_lsp" },
          -- Displays diagnostics for the defined severity types
          --
          sections = { "error", "warn", "info", "hint" },

          diagnostics_color = {
            -- Same values as the general color option can be used here.
            error = "DiagnosticError", -- Changes diagnostics' error color.
            warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
            info = "DiagnosticInfo", -- Changes diagnostics' info color.
            hint = "DiagnosticHint", -- Changes diagnostics' hint color.
          },
          symbols = {
            error = Config.icons.diagnostics.Error,
            warn = Config.icons.diagnostics.Warn,
            info = Config.icons.diagnostics.Info,
            hint = Config.icons.diagnostics.Hint,
          },
          colored = true, -- Displays diagnostics status in color if set to true.
          update_in_insert = true, -- Update diagnostics in insert mode.
          always_visible = true, -- Show diagnostics even if there are none.
        },

        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
      },
      lualine_x = {
        {
          "diff",
          colored = true, -- Displays a colored diff status if set to true
          -- Changes the symbols used by the diff.
          symbols = {
            added = Config.icons.git.added,
            modified = Config.icons.git.modified,
            removed = Config.icons.git.removed,
          },
        },
      },
      lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      },
      lualine_z = {
        function()
          return "󰥔 " .. os.date("%R")
        end,
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "nvim-tree" },
  },
  config = function(_, opts)
    require("lualine").setup(opts)
    vim.opt.laststatus = 3
  end,
  event = "BufReadPost",
}
