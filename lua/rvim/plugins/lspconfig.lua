return {
  -- Quickstart configurations for the LSP client.
  -- For more information visit: https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim" },
    },
    opts = {
      -- Options for vim.diagnostic.config()
      ---@type vim.diagnostic.Opts
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = rvim.config.icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = rvim.config.icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = rvim.config.icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = rvim.config.icons.diagnostics.Info,
          },
        },
      },
    },
    config = function(_, opts)
      require("rvim.util").lsp.setup() -- Setup default config for lsp servers

      for severity, icon in pairs(opts.diagnostics.signs.text) do
        local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local has_blink, blink_cmp = pcall(require, "blink-cmp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_blink and blink_cmp.get_lsp_capabilities() or {}
      )

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup(
            vim.tbl_deep_extend("force", capabilities, rvim.config.servers[server_name] or {})
          )
        end,
      })
    end,
  },

  -- Portable package manager that runs everywhere Neovim runs.
  -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
  -- For more information visit: https://github.com/williamboman/mason.nvim
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = {
      ui = {
        border = rvim.config.border,
        icons = {
          package_pending = " ",
          package_installed = " ",
          package_uninstalled = " ",
        },
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },
}
