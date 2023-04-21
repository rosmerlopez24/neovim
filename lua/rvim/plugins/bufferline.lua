return {
  "akinsho/bufferline.nvim",
  lazy = true,
  opts = {
    options = {
      mode = "buffers",
      indicator = { icon = "▎", style = "icon" },
      diagnostics = false,
      diagnostics_update_in_insert = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
      color_icons = true,
      persist_buffer_sort = true,
      sort_by = "insert_at_end",
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
  event = "VeryLazy",
  keys = {
    { "<TAB>", "<cmd>BufferLineCycleNext<cr>", "n" },
    { "<S-TAB>", "<cmd>BufferLineCyclePrev<cr>", "n" },
  },
}
