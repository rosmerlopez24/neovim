return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neodev.nvim",
    "barbecue.nvim",
    "clangd_extensions.nvim",
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
}
