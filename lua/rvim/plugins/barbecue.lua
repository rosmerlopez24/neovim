return {
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
}
