local M = {}

-- Setup Configurations
---@return nil
function M.setup()
  -- Setup default config
  Config = vim.deepcopy(require("rvim.config.defaults"))

  -- Try load user config based on default config
  local present, _ = pcall(require, "rvim.config.config")
  if not present then
    vim.notify("Don't loaded user config!", vim.log.levels.INFO)
  end

  -- Setup global options
  require("rvim.core.options")
  -- Setup global autocommands
  require("rvim.core.autocmds")
  -- Setup global keymaps
  require("rvim.core.keymaps")
  -- Setup plugins manager
  require("rvim.core.lazy")
end

return M
