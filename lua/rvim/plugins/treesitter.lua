return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = "BufReadPost",
    ---@type TSConfig
    opts = config.plugins.treesitter,
    ---@param opts TSConfig
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
