return {
  "mhartington/formatter.nvim",
  dependencies = { "mason.nvim" },
  config = function()
    -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
    require("formatter").setup({
      -- All formatter configurations are opt-in
      filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
          -- "formatter.filetypes.lua" defines default configurations for the
          -- "lua" filetype
          require("formatter.filetypes.lua").stylua,
        },

        python = {
          require("formatter.filetypes.python").autopep8,
        },

        sh = {
          require("formatter.filetypes.sh").shfmt,
        },

        yaml = {
          require("formatter.filetypes.yaml").yamlfmt,
        },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
          -- "formatter.filetypes.any" defines default configurations for any
          -- filetype
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })
  end,
  event = "BufReadPost",
}
