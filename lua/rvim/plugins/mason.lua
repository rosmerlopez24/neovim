-- See for more information -> :h mason-settings
return {
  "williamboman/mason.nvim",
  opts = {
    -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
    -- packages that are requested to be installed will be put in a queue.
    max_concurrent_installers = 1,

    ui = {
      -- Whether to automatically check for new versions when opening the :Mason window.
      check_outdated_packages_on_open = true,

      -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
      border = Config.border,

      icons = {
        -- The list icon to use for installed packages.
        package_pending = " ",
        -- The list icon to use for packages that are installing, or queued for installation.
        package_installed = " ",
        -- The list icon to use for packages that are not installed.
        package_uninstalled = "󰅙 ",
      },
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
  end,
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>" } },
}
