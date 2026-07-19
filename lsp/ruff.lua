---@type vim.lsp.Config
return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { ".venv", "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
  settings = {},
}
