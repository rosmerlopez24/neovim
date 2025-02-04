return {
  -- A simple and fast file explorer tree.
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>" },
    },
    opts = {
      hijack_cursor = true,
      view = {
        centralize_selection = false,
        cursorline = true,
        debounce_delay = 15,
        number = false,
        preserve_window_proportions = true,
        relativenumber = false,
        side = "left",
        signcolumn = "yes",
        width = 30,
      },
      renderer = {
        add_trailing = false,
        full_name = false,
        group_empty = false,
        hidden_display = "none",
        highlight_bookmarks = "none",
        highlight_clipboard = "name",
        highlight_diagnostics = "none",
        highlight_git = "none",
        highlight_hidden = "none",
        highlight_modified = "name",
        highlight_opened_files = "name",
        indent_width = 2,
        root_folder_label = false,
        symlink_destination = true,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          bookmarks_placement = "signcolumn",
          diagnostics_placement = "signcolumn",
          git_placement = "before",
          hidden_placement = "after",
          modified_placement = "after",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            bookmarks = true,
            diagnostics = false,
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            hidden = false,
            modified = true,
          },
          glyphs = {
            bookmark = "󰆤",
            default = "",
            hidden = "󰜌",
            modified = "●",
            symlink = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
            },
          },
        },
      },
      git = { enable = false },
      diagnostics = { enable = false },
      modified = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = false,
      },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
    },
  },

  -- Git integration: signs, hunk actions, blame, etc.
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "BufReadPost",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      signs_staged_enable = true,
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true,
      },
      on_attach = nil,
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = RVimOptions.border,
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    },
  },
}
