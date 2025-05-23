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
