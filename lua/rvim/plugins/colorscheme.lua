return {
  -- For more information visit this Repo
  -- https://github.com/marko-cerovac/material.nvim
  {
    "marko-cerovac/material.nvim",
    name = "material",
    priority = 1000,
    lazy = rvim.config.colorscheme ~= "material",
    opts = {
      contrast = {
        terminal = false, -- Enable contrast for the built-in terminal
        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = false, -- Enable contrast for floating windows
        cursor_line = false, -- Enable darker background for the cursor line
        lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
        non_current_windows = false, -- Enable contrasted background for non-current windows
        filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
      },
      plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "coc",
        -- "colorful-winsep",
        -- "dap",
        -- "dashboard",
        -- "eyeliner",
        -- "fidget",
        -- "flash",
        "gitsigns",
        -- "harpoon",
        -- "hop",
        -- "illuminate",
        "indent-blankline",
        -- "lspsaga",
        -- "mini",
        -- "neogit",
        -- "neotest",
        -- "neo-tree",
        -- "neorg",
        -- "noice",
        "nvim-cmp",
        -- "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
        -- "rainbow-delimiters",
        -- "sneak",
        -- "telescope",
        -- "trouble",
        -- "which-key",
        -- "nvim-notify",
      },
      disable = {
        colored_cursor = false, -- Disable the colored cursor
        borders = false, -- Disable borders between vertically split windows
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false, -- Hide the end-of-buffer lines
      },
      high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false, -- Enable higher contrast text for darker style
      },
      lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
      async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)
      custom_colors = nil, -- If you want to override the default colors, set this to a function
      custom_highlights = {}, -- Overwrite highlights with your own
    },
    config = function(_, opts)
      require("material").setup(opts)
    end,
  },

  -- For more information visit this Repo
  -- https://github.com/shaunsingh/nord.nvim
  {
    "shaunsingh/nord.nvim",
    name = "nord",
    priority = 1000,
    lazy = rvim.config.colorscheme ~= "nord",
    config = function()
      vim.g.nord_italic = false
    end,
  },

  -- For more information visits this Repo
  -- https://github.com/catppuccin/nvim
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = rvim.config.colorscheme ~= "catppuccin",
    opts = {
      flavour = rvim.config.style,
      default_integrations = false,
      integrations = {
        blink_cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        mason = true,
        indent_blankline = {
          enabled = true,
          scope_color = "",
          colored_indent_levels = false,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
          },
          inlay_hints = {
            background = true,
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
    priority = 1000,
    lazy = rvim.config.colorscheme ~= "tokyonight",
    opts = {
      style = rvim.config.style, -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = false, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      dim_inactive = false, -- dims inactive windows
      lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
      cache = true, -- When set to true, the theme will be cached for better performance
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
    end,
  },

  -- Atom's iconic One Dark theme for Neovim
  -- https://github.com/olimorris/onedarkpro.nvim
  {
    "olimorris/onedarkpro.nvim",
    name = "onedark",
    lazy = rvim.config.colorscheme ~= "onedark",
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("onedarkpro").setup(opts)
    end,
  },

  -- All natural pine, faux fur and a bit of soho vibes for the classy minimalist
  -- https://github.com/rose-pine/neovim
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = rvim.config.colorscheme ~= "rose-pine",
    priority = 1000,
    opts = {
      variant = rvim.config.style,
      dark_variant = rvim.config.style,
      styles = { italic = false },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
    end,
  },

  -- This is a port of the popular Visual Studio Code Themes Bluloco Light and Bluloco Dark
  -- https://github.com/uloco/bluloco.nvim
  {
    "uloco/bluloco.nvim",
    name = "bluloco",
    lazy = rvim.config.colorscheme ~= "bluloco",
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    opts = {
      style = rvim.config.style,
      transparent = false,
      italics = false,
      terminal = vim.fn.has("gui_running") == 1,
      guicursor = true,
      rainbow_headings = false,
    },
    config = function(_, opts)
      require("bluloco").setup(opts)
    end,
  },

  -- NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.
  -- https://github.com/rebelot/kanagawa.nvim
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = rvim.config.colorscheme ~= "kanagawa",
    priority = 1000,
    opts = {
      compile = true,
      undercurl = true,
      commentStyle = { italic = false },
      functionStyle = {},
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = false,
      colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
      overrides = function(colors)
        local theme = colors.theme
        return {
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
      theme = rvim.config.style,
      background = { dark = "dragon", light = "lotus" },
    },
    config = function(_, opts)
      vim.g.kanagawa_lualine_bold = true
      require("kanagawa").setup(opts)
    end,
  },
}
