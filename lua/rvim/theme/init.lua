-- Supported colorscheme
local supported_themes = {
  "catppuccin",
  "material",
  "nord",
  "onedark",
  "tokyonight",
}

local M = {}

-- Setup and load default colorscheme
function M.load_theme()
  if vim.tbl_contains(supported_themes, config.colorscheme) then
    if config.colorscheme == "catppuccin" then
      vim.cmd.colorscheme("catppuccin")
    elseif config.colorscheme == "material" then
      vim.g.material_style = config.style
      vim.cmd.colorscheme("material")
    elseif config.colorscheme == "nord" then
      require("nord").set()
    elseif config.colorscheme == "onedark" then
      require("onedark").load()
    elseif config.colorscheme == "tokyonight" then
      require("tokyonight").load()
    else
      vim.notify("Colorscheme is not available", vim.log.levels.INFO)
    end
  end
end

return M
