return {
  "nvim-lualine/lualine.nvim",
  lazy = true,
  opts = {
    options = {
      icons_enabled = true,
      theme = config.colorscheme,
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      disabled_filetypes = { "NvimTree" },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { { "mode", icon = "" } },
      lualine_b = {
        "branch",
        {
          "diff",
          colored = true, -- Displays a colored diff status if set to true
          -- Changes the symbols used by the diff.
          symbols = {
            added = config.icons.git.added,
            modified = config.icons.git.modified,
            removed = config.icons.git.removed,
          },
        },
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
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
          colored = true, -- Displays diagnostics status in color if set to true.
          update_in_insert = false, -- Update diagnostics in insert mode.
          always_visible = false, -- Show diagnostics even if there are none.
        },
      },
      lualine_c = {},
      lualine_x = {
        {
          "fileformat",
          symbols = {
            unix = "",
            dos = "",
            mac = "",
          },
        },
        {
          "filetype",
          colored = true, -- Displays filetype icon in color if set to true
          icon_only = false, -- Display only an icon for filetype
          icon = { align = "left" }, -- Display filetype icon on the right hand side
        },
      },
      lualine_y = {},
      lualine_z = { "progress", "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
  },
  config = function(_, opts)
    require("lualine").setup(opts)
    vim.opt.laststatus = 3
  end,
  event = "BufReadPost",
}
