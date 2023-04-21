return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  version = false, -- Last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  ---@type TSConfig
  opts = {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = Config.plugins.treesitter.ensure_installed,
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = Config.plugins.treesitter.auto_install,
    -- List of parsers to ignore installing (for "all")
    ignore_install = Config.plugins.treesitter.ignore_install,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = false },
  },
  ---@param opts TSConfig
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
  event = "BufReadPost",
}
