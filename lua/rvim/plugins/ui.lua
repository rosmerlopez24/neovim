return {
  -- A snazzy buffer line built using Lua.
  {
    "akinsho/bufferline.nvim",
    lazy = true,
    opts = {
      options = {
        mode = "buffers",
        indicator = { icon = "▎", style = "icon" },
        diagnostics = false,
        diagnostics_update_in_insert = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
        color_icons = true,
        persist_buffer_sort = true,
        sort_by = "insert_at_end",
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
    end,
    event = "VeryLazy",
    keys = {
      { "<TAB>", "<cmd>BufferLineCycleNext<cr>", "n" },
      { "<S-TAB>", "<cmd>BufferLineCyclePrev<cr>", "n" },
    },
  },

  -- A blazing fast and easy to configure Neovim statusline.
  {
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
    event = { "BufRead" },
  },

  -- A simple and fast file explorer tree.
  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    opts = {
      auto_reload_on_write = true,
      disable_netrw = true,
      hijack_cursor = true,
      hijack_netrw = true,
      hijack_unnamed_buffer_when_opening = false,
      view = {
        centralize_selection = true,
        cursorline = true,
        width = 30,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
      },
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "name",
        root_folder_modifier = ":~",
        indent_width = 2,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          modified_placement = "after",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            modified = "●",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
          },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        symlink_destination = true,
      },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      git = { enable = false },
      actions = { open_file = { resize_window = true } },
    },
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
    version = "*",
    cmd = "NvimTreeToggle",
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>" },
    },
  },

  -- A VS Code like winbar.
  {
    "utilyre/barbecue.nvim",
    lazy = true,
    dependencies = { "SmiteshP/nvim-navic", lazy = true },
    opts = {
      attach_navic = false,
      create_autocmd = false,
      show_dirname = true,
      show_basename = true,
      theme = Config.colorscheme,
      kinds = Config.icons.kinds,
    },
    config = function(_, opts)
      require("barbecue").setup(opts)
      vim.api.nvim_create_autocmd({
        "WinScrolled",
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",
        "BufWritePost",
        "TextChanged",
        "TextChangedI",
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end,
    version = "*",
  },

  -- IndentLine replacement in Lua with more features and treesitter support.
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    main = "ibl",
    opts = {},
    config = function(_, opts)
      require("ibl").setup(opts)
    end,
    event = { "BufRead" },
  },

  -- A Lua fork of vim-devicons.
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
