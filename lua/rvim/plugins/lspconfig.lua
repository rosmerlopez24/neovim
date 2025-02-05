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
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = RVimOptions.icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = RVimOptions.icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = RVimOptions.icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = RVimOptions.icons.diagnostics.Info,
          },
        },
      },
      -- Add any global capabilities here
      ---@type table
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },
    },
    config = function(_, opts)
      -- Setup mappings
      ---@diagnostic disable-next-line
      require("rvim.util").lsp.on_attach(function(client, buffer)
        require("rvim.util").lsp.default_mappings(buffer)
      end)

      -- Setup Lsp
      require("rvim.util").lsp.setup()

      -- Setup diagnostics signs
      for severity, icon in pairs(opts.diagnostics.signs.text) do
        local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      -- Setup diagnostics config
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      -- Setup capabilities
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      ---@param server_name string
      ---@return nil
      local function setup(server_name)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, RVimOptions.servers[server_name] or {})
        require("lspconfig")[server_name].setup(server_opts)
      end

      require("mason-lspconfig").setup_handlers({ setup })
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
        border = RVimOptions.border,
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
