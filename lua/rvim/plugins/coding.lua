return {
  -- blink.cmp is a completion plugin with support for LSPs and external sources
  -- that updates on every keystroke with minimal overhead (0.5-4ms async).
  -- For more information visit: https://github.com/Saghen/blink.cmp
  {
    "saghen/blink.cmp",
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { "rafamadriz/friendly-snippets", "lazydev.nvim" },
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "enter" },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
        kind_icons = rvim.config.icons.kinds,
      },
      completion = {
        accept = { auto_brackets = { enabled = false } },
        menu = {
          border = rvim.config.border,
          draw = {
            treesitter = { "lsp" },
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          window = { border = rvim.config.border },
        },
        ghost_text = { enabled = true },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "lazydev" },
        providers = {
          lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
        },
      },
      fuzzy = { implementation = "rust" },
      signature = { enabled = true, window = { border = rvim.config.border } },
    },
    opts_extend = { "sources.default", "sources.completion.enabled_providers" },
  },

  -- lazydev.nvim is a plugin that properly configures LuaLS for editing your Neovim config
  -- by lazily updating your workspace libraries.
  -- For more information visit: https://github.com/folke/lazydev.nvim
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    opts = {
      ---@diagnostic disable-next-line
      ---@type lazydev.Library.spec[]
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "lazy.nvim", words = { "lazy" } },
        { path = "rvim", words = { "rvim" } },
      },
    },
  },
}
