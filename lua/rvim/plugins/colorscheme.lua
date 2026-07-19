return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      light_style = "day",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false, bold = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      day_brightness = 0.3,
      dim_inactive = false,
      lualine_bold = true,
      cache = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
    end,
  },
}
