return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "契" },
      topdelete = { text = "契" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    preview_config = {
      -- Options passed to nvim_open_win
      border = Config.border,
    },
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
  event = "BufReadPost",
}
