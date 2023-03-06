local M = {}

M.buffer_mappings = {
  normal_mode = {
    ["gD"] = vim.lsp.buf.declaration,
    ["gd"] = vim.lsp.buf.definition,
    ["gi"] = vim.lsp.buf.implementation,
    ["gr"] = vim.lsp.buf.references,
    ["K"] = vim.lsp.buf.hover,
    ["<C-k>"] = vim.lsp.buf.signature_help,
    ["<leader>ra"] = vim.lsp.buf.rename,
    ["<leader>ca"] = vim.lsp.buf.code_action,
    ["<leader>fm"] = function()
      vim.lsp.buf.format({ async = true })
    end,
    ["<leader>f"] = vim.diagnostic.open_float,
    ["[d"] = vim.diagnostic.goto_prev,
    ["d]"] = vim.diagnostic.goto_next,
  },
}

M.buffer_options = {
  --- enable completion triggered by <c-x><c-o>
  omnifunc = "v:lua.vim.lsp.omnifunc",
  --- use gq for formatting
  formatexpr = "v:lua.vim.lsp.formatexpr(#{timeout_ms:500})",
}

-- options for vim.diagnostic.config()
M.diagnostics = {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
  float = {
    border = config.border,
  },
}

return M
