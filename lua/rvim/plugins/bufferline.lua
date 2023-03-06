return {
  "akinsho/bufferline.nvim",
  lazy = true,
  opts = {
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
        },
      },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    vim.keymap.set("n", "<TAB>", function()
      vim.cmd([[BufferLineCycleNext]])
    end, { noremap = true, silent = true })
  end,
  event = "VeryLazy",
}
