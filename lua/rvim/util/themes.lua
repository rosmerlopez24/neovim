-- Supported colorscheme
local supported_themes = {
  "catppuccin",
  "material",
  "nord",
  "onedark",
  "tokyonight",
}

local M = {}

-- Set colorscheme based in Config
function M.setup()
  if vim.tbl_contains(supported_themes, Config.colorscheme) then
    if Config.colorscheme == "catppuccin" then
      vim.cmd.colorscheme("catppuccin")
    elseif Config.colorscheme == "material" then
      vim.g.material_style = Config.style
      vim.cmd.colorscheme("material")
    elseif Config.colorscheme == "nord" then
      require("nord").set()
    elseif Config.colorscheme == "onedark" then
      vim.cmd.colorscheme("onedark")
    elseif Config.colorscheme == "tokyonight" then
      require("tokyonight").load()
    end
  else
    vim.notify("The colorscheme is not available!", vim.log.levels.WARN)
  end
end

return M
