return {
  -- For more information visit this Repo
  -- https://github.com/marko-cerovac/material.nvim
  {
    "marko-cerovac/material.nvim",
    name = "material",
    lazy = Config.colorscheme ~= "material",
    opts = {
      contrast = {
        terminal = false,
        sidebars = true,
        floating_windows = false,
        cursor_line = false,
        non_current_windows = false,
        filetypes = {},
      },
      plugins = {
        "gitsigns",
        "indent-blankline",
        "nvim-cmp",
        "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
      },
    },
    config = function(_, opts)
      require("material").setup(opts)
    end,
  },

  -- For more information visit this Repo
  -- https://github.com/olimorris/onedarkpro.nvim
  {
    "olimorris/onedarkpro.nvim",
    name = "onedark",
    lazy = Config.colorscheme ~= "onedark",
    opts = {
      plugins = { -- Override which plugin highlight groups are loaded
        aerial = false,
        barbar = false,
        copilot = false,
        dashboard = false,
        gitsigns = true,
        hop = false,
        indentline = true,
        leap = false,
        lsp_saga = false,
        lsp_semantic_tokens = true,
        marks = false,
        neotest = false,
        neo_tree = false,
        nvim_cmp = true,
        nvim_bqf = false,
        nvim_dap = false,
        nvim_dap_ui = false,
        nvim_hlslens = false,
        nvim_lsp = true,
        nvim_navic = true,
        nvim_notify = false,
        nvim_tree = true,
        nvim_ts_rainbow = false,
        op_nvim = false,
        packer = false,
        polygot = false,
        startify = false,
        telescope = false,
        toggleterm = false,
        treesitter = true,
        trouble = false,
        vim_ultest = false,
        which_key = false,
      },
      styles = { -- For example, to apply bold and italic, use "bold,italic"
        types = "bold", -- Style that is applied to types
        methods = "NONE", -- Style that is applied to methods
        numbers = "NONE", -- Style that is applied to numbers
        strings = "NONE", -- Style that is applied to strings
        comments = "italic", -- Style that is applied to comments
        keywords = "bold", -- Style that is applied to keywords
        constants = "bold", -- Style that is applied to constants
        functions = "bold", -- Style that is applied to functions
        operators = "NONE", -- Style that is applied to operators
        variables = "NONE", -- Style that is applied to variables
        parameters = "italic", -- Style that is applied to parameters
        conditionals = "bold", -- Style that is applied to conditionals
        virtual_text = "NONE", -- Style that is applied to virtual text
      },
    },
    config = function(_, opts)
      require("onedarkpro").setup(opts)
    end,
  },

  -- For more information visit this Repo
  -- https://github.com/shaunsingh/nord.nvim
  {
    "shaunsingh/nord.nvim",
    name = "nord",
    lazy = Config.colorscheme ~= "nord",
    config = function()
      vim.g.nord_contrast = false
      vim.g.nord_borders = true
      vim.g.nord_disable_background = true
      vim.g.nord_cursorline_transparent = false
      vim.g.nord_enable_sidebar_background = false
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = false
    end,
  },

  -- For more information visits this Repo
  -- https://github.com/catppuccin/nvim
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = Config.colorscheme ~= "catppuccin",
    opts = {
      flavour = Config.style,
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      term_colors = true,
      compile = {
        enabled = true,
        path = vim.fn.stdpath("cache") .. "/catppuccin",
      },
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "bold" },
        loops = { "bold" },
        functions = { "bold" },
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      integrations = {
        barbecue = {
          dim_dirname = true,
          bold_basename = true,
          dim_context = false,
        },
        cmp = true,
        gitsigns = true,
        mason = true,
        nvimtree = true,
        treesitter = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
    end,
  },

  -- For more information visit this Repo
  -- https://github.com/folke/tokyonight.nvim
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = Config.colorscheme ~= "tokyonight",
    opts = {
      style = Config.style,
      light_style = "day",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "normal",
        floats = "normal",
      },
      sidebars = { "qf", "help", "NvimTree" },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
    end,
  },
}
