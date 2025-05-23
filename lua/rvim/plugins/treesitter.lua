return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- Last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  event = "BufReadPost",
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  opts = {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = rvim.config.treesitter.ensure_installed,
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = rvim.config.treesitter.auto_install,
    -- List of parsers to ignore installing (for "all")
    ignore_install = rvim.config.treesitter.ignore_install,
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
