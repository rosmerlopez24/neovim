local M = {}

-- Setup My Neovim Configurations
---@return nil
function M.setup()
  require("rvim.core").setup()
  require("rvim.util.themes").setup()
end

return M
