return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neodev.nvim",
  },
  config = function()
    require("rvim.lsp").setup()

    local function setup(server_name)
      local server_opts = vim.tbl_deep_extend("force", {
        on_attach = require("rvim.lsp").on_attach,
        capabilities = require("rvim.lsp").capabilities,
      }, config.servers[server_name] or {})

      require("lspconfig")[server_name].setup(server_opts)
    end

    -- Temp fix for lspconfig rename
    -- https://github.com/neovim/nvim-lspconfig/pull/2439
    local mappings = require("mason-lspconfig.mappings.server")
    if not mappings.lspconfig_to_package.lua_ls then
      mappings.lspconfig_to_package.lua_ls = "lua-language-server"
      mappings.package_to_lspconfig["lua-language-server"] = "lua_ls"
    end

    require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(config.servers) })
    require("mason-lspconfig").setup_handlers({ setup })
  end,
}
