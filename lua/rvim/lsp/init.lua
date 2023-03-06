local buffer_options = require("rvim.lsp.config").buffer_options
local buffer_mappings = require("rvim.lsp.config").buffer_mappings
local diagnostics = require("rvim.lsp.config").diagnostics

local function add_lsp_buffer_options(bufnr)
  for k, v in pairs(buffer_options) do
    vim.api.nvim_buf_set_option(bufnr, k, v)
  end
end

local function add_lsp_buffer_keybindings(bufnr)
  local mappings = { normal_mode = "n" }
  for mode_name, mode_char in pairs(mappings) do
    for key, remap in pairs(buffer_mappings[mode_name]) do
      local opts = { buffer = bufnr, noremap = true, silent = true }
      vim.keymap.set(mode_char, key, remap, opts)
    end
  end
end

local function add_lsp_diagnostic_sign()
  for name, icon in pairs(config.icons.diagnostics) do
    name = "DiagnosticSign" .. name
    vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
  end
end

local M = {}

function M.setup()
  -- Setup diagnostics
  add_lsp_diagnostic_sign()
  vim.diagnostic.config(diagnostics)

  -- Setup handlers
  -- vim.lsp.handlers opts
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = config.border,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = config.border,
  })
end

function M.on_attach(_, bufnr)
  add_lsp_buffer_keybindings(bufnr)
  add_lsp_buffer_options(bufnr)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)

return M
