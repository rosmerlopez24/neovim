return {
  -- A blazing fast and easy to configure Neovim statusline.
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "BufReadPost",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = {
      options = {
        icons_enabled = true,
        theme = rvim.config.colorscheme,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "NvimTree", "lazy" },
        },
        always_divide_middle = true,
        globalstatus = vim.o.laststatus == 3,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          { "branch" },
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            sections = { "error", "warn", "info", "hint" },
            diagnostics_color = {
              error = "DiagnosticError",
              warn = "DiagnosticWarn",
              info = "DiagnosticInfo",
              hint = "DiagnosticHint",
            },
            symbols = {
              error = rvim.config.icons.diagnostics.Error,
              warn = rvim.config.icons.diagnostics.Warn,
              info = rvim.config.icons.diagnostics.Info,
              hint = rvim.config.icons.diagnostics.Hint,
            },
            colored = true,
            update_in_insert = true,
            always_visible = true,
          },
        },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = { modified = "  ", readonly = "", unnamed = "" },
          },
        },
        lualine_x = {
          {
            "diff",
            colored = true,
            symbols = {
              added = rvim.config.icons.git.added,
              modified = rvim.config.icons.git.modified,
              removed = rvim.config.icons.git.removed,
            },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = {
          { "progress", separator = "", padding = { left = 1, right = 1 } },
        },
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
    },
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },

  -- IndentLine replacement in Lua with more features and treesitter support.
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "BufReadPost",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { show_start = false, show_end = false },
      exclude = {
        filetypes = {
          "help",
          "nvim-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
        },
      },
    },
    main = "ibl",
  },

  -- A Lua fork of vim-devicons.
  { "nvim-tree/nvim-web-devicons", lazy = true, opts = {} },
}
