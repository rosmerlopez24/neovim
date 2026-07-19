local M = {}

---@class rvim.options
local defaults = {
  ---@type string|fun()
  colorscheme = "tokyonight",
  -- See :h nvim_open_win for possible border options
  ---@type string
  border = "none",
  treesitter = {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "diff",
      "json",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "make",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "vim",
      "yaml",
    },
  },
  icons = {
    diagnostics = {
      Error = " ",
      Hint = " ",
      Info = " ",
      Warn = " ",
    },
    git = {
      added = " ",
      modified = " ",
      removed = " ",
    },
    kinds = {
      Array = " ",
      Boolean = "󰨙 ",
      Class = " ",
      Codeium = "󰘦 ",
      Collapsed = " ",
      Color = " ",
      Constant = "󰏿 ",
      Constructor = " ",
      Control = " ",
      Copilot = " ",
      Enum = " ",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = "󰊕 ",
      Interface = " ",
      Key = " ",
      Keyword = " ",
      Method = "󰊕 ",
      Module = " ",
      Namespace = "󰦮 ",
      Null = " ",
      Number = "󰎠 ",
      Object = " ",
      Operator = " ",
      Package = " ",
      Property = " ",
      Reference = " ",
      Snippet = "󱄽 ",
      String = " ",
      Struct = "󰆼 ",
      Supermaven = " ",
      TabNine = "󰏚 ",
      Text = " ",
      TypeParameter = " ",
      Unit = " ",
      Value = " ",
      Variable = "󰀫 ",
    },
  },
}

function M.setup()
  vim.loader.enable()
  vim.g.loaded_perl_provider = 0
  vim.g.loaded_python3_provider = 0
  vim.g.loaded_ruby_provider = 0
  vim.g.loaded_node_provider = 0

  _G.rvim = require("rvim.util")
  rvim.config = vim.deepcopy(defaults)

  local user_config = "rvim.rvimrc"
  local present, err = pcall(require, user_config)
  if not present then
    if not string.match(err or "", "module '" .. user_config .. "' not found") then
      vim.notify(
        string.format("Error critico de sintaxis en %s: %s", user_config, err),
        vim.log.levels.ERROR
      )
    end
  end

  require("rvim.config.options")
  require("rvim.config.autocmds")
  require("rvim.config.keymaps")
  require("rvim.config.lazy")

  vim.cmd.colorscheme(rvim.config.colorscheme)

  vim.schedule(function()
    rvim.lsp.setup_diagnostics_config()
    rvim.lsp.setup_lsp_config()
    vim.lsp.enable({ "lua_ls", "ruff", "ty" })
  end)
end

return M
