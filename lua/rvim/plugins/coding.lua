return {
  -- blink.cmp is a completion plugin with support for LSPs and external sources
  -- that updates on every keystroke with minimal overhead (0.5-4ms async).
  -- For more information visit: https://github.com/Saghen/blink.cmp
  {
    "saghen/blink.cmp",
    lazy = true,
    event = "BufReadPost",
    dependencies = { "rafamadriz/friendly-snippets", "lazydev.nvim" },
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = "enter" },
      appearance = {
        nerd_font_variant = "mono",
        kind_icons = rvim.config.icons.kinds,
      },
      completion = {
        accept = {
          auto_brackets = { enabled = true },
        },
        documentation = {
          auto_show = false,
          auto_show_delay_ms = 500,
          window = { border = rvim.config.border },
        },
        menu = {
          border = rvim.config.border,
          scrolloff = 2,
          scrollbar = false,
          draw = {
            treesitter = { "lsp" },
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind" },
            },
          },
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "lazydev" },
        providers = {
          lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true, window = { border = rvim.config.border } },
    },
    opts_extend = { "sources.default", "sources.completion.enabled_providers" },
  },

  -- lazydev.nvim is a plugin that properly configures LuaLS for editing your Neovim config
  -- by lazily updating your workspace libraries.
  -- For more information visit: https://github.com/folke/lazydev.nvim
  {
    "folke/lazydev.nvim",
    ft = "lua", -- Only load on lua files
    cmd = "LazyDev",
    opts = {
      ---@diagnostic disable-next-line
      ---@type lazydev.Library.spec[]
      library = {
        { path = "lazy.nvim", words = { "lazy" } },
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "rvim", words = { "rvim" } },
      },
    },
  },
}
