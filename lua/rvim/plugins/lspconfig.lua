return {
  -- Quickstart configurations for the LSP client.
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neodev.nvim",
      "barbecue.nvim",
    },
    config = function()
      require("rvim.lsp").setup_diagnostics()
      require("rvim.lsp").setup_handlers()

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local function setup(server_name)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, Config.servers[server_name] or {})

        require("lspconfig")[server_name].setup(server_opts)
      end

      require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(Config.servers) })
      require("mason-lspconfig").setup_handlers({ setup })
      require("rvim.lsp").on_attach(function(client, bufnr)
        require("rvim.lsp").add_lsp_buffer_options(bufnr)
        require("rvim.lsp").add_lsp_buffer_mappings(bufnr)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, bufnr)
        end
      end)
    end,
  },

  -- Portable package manager that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.
  {
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
  },

  -- Dev setup for init.lua and plugin development with full signature help, docs and completion for the Neovim Lua API.
  {
    "folke/neodev.nvim",
    lazy = true,
    opts = {
      library = {
        enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
        -- these settings will be used for your Neovim config directory
        runtime = true, -- runtime path
        types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        plugins = true, -- installed opt or start plugins in packpath
        -- you can also specify the list of plugins to make available as a workspace library
        -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
      },
      setup_jsonls = false, -- configures jsonls to provide completion for project specific .luarc.json files
      -- With lspconfig, Neodev will automatically setup your lua-language-server
      -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
      -- in your lsp start options
      lspconfig = true,
      -- much faster, but needs a recent built of lua-language-server
      -- needs lua-language-server >= 3.6.0
      pathStrict = true,
    },
    config = function(_, opts)
      require("neodev").setup(opts)
    end,
  },
}
