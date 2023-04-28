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

  -- Setup colorscheme
  require("lazy.core.util").try(function()
    if Config.colorscheme == "material" then
      vim.g.material_style = Config.style
    end
    vim.cmd.colorscheme(Config.colorscheme)
  end, {
    msg = "Could not load your colorscheme",
    on_error = function(msg)
      require("lazy.core.util").error(msg)
      vim.cmd.colorscheme("habamax")
    end,
  })
end

return M
