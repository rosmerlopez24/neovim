---@class rvim.util.lsp
local M = {}

-- Set key-mapping config for LSP
function M.set_key_mapping_config()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("rvim_key_mapping_config", { clear = true }),
    callback = function(event)
      -- Custom only local function
      local function map(keys, func, desc)
        ---@type vim.api.keyset.keymap
        local default = { silent = true, noremap = true }
        ---@type vim.api.keyset.keymap
        local opts = { desc = "LSP: " .. desc, callback = func }
        opts = vim.tbl_deep_extend("force", default, opts)
        vim.api.nvim_buf_set_keymap(event.buf, "n", keys, "", opts)
      end
      -- Using the after local function
      map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction")
      map("grr", vim.lsp.buf.references, "[G]oto [R]eferences")
      map("gri", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
      map("grd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      map("gO", vim.lsp.buf.document_symbol, "Open Document Symbols")
      map("gW", vim.lsp.buf.workspace_symbol, "Open Workspace Symbols")
      map("grt", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
      map("K", vim.lsp.buf.hover, "Open Hover")
      map("gK", vim.lsp.buf.signature_help, "Open Signature Help")
    end,
  })
end

-- Set the diagnostic config
function M.set_diagnostic_config()
  -- Diagnostic Config
  -- See :help vim.diagnostic.Opts
  vim.diagnostic.config({
    severity_sort = true,
    float = { border = rvim.config.border, source = "if_many" },
    underline = { severity = vim.diagnostic.severity.ERROR },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = rvim.config.icons.diagnostics.Error,
        [vim.diagnostic.severity.WARN] = rvim.config.icons.diagnostics.Warn,
        [vim.diagnostic.severity.HINT] = rvim.config.icons.diagnostics.Hint,
        [vim.diagnostic.severity.INFO] = rvim.config.icons.diagnostics.Info,
      },
    } or {},
    virtual_text = {
      prefix = "●",
      source = "if_many",
      spacing = 2,
      format = function(diagnostic)
        local diagnostic_message = {
          [vim.diagnostic.severity.ERROR] = diagnostic.message,
          [vim.diagnostic.severity.WARN] = diagnostic.message,
          [vim.diagnostic.severity.INFO] = diagnostic.message,
          [vim.diagnostic.severity.HINT] = diagnostic.message,
        }
        return diagnostic_message[diagnostic.severity]
      end,
    },
  })
end

--- Gets the capabilities to pass to the LSP client
function M.get_lsp_capabilities()
  return vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities() or {}, {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
          commitCharactersSupport = false,
          documentationFormat = { "markdown", "plaintext" },
          deprecatedSupport = true,
          preselectSupport = false,
          tagSupport = { valueSet = { 1 } },
          insertReplaceSupport = true,
          resolveSupport = {
            properties = {
              "documentation",
              "detail",
              "additionalTextEdits",
              "command",
              "data",
            },
          },
          insertTextModeSupport = {
            valueSet = { 1 },
          },
          labelDetailsSupport = true,
        },
        completionList = {
          itemDefaults = {
            "commitCharacters",
            "editRange",
            "insertTextFormat",
            "insertTextMode",
            "data",
          },
        },
        contextSupport = true,
        insertTextMode = 1, -- asIs
      },
    },
  })
end

return M
