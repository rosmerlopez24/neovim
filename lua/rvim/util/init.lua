---@class rvim.util
---@field cmp rvim.util.cmp
---@field lsp rvim.util.lsp
---@field ui rvim.util.ui
---@field bufdelete rvim.util.bufdelete
local M = {}

setmetatable(M, {
  __index = function(table, key)
    local ok, module = pcall(require, "rvim.util." .. key)
    if ok then
      table[key] = module
      return module
    else
      -- You can customize the error message according to your needs
      error("Failed to load module: rvim.util." .. key .. "\n" .. module, 2)
      return nil -- Or you could return another default value
    end
  end,
})

return M
