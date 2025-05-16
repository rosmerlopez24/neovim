---@class rvim.util.lsp
local M = {}

function M.setup()
  -- Autocommand LspAttach
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("rvim-lsp-attach", {}),
    callback = function(event)
      local buffer = event.buf ---@type number
      local client = vim.lsp.get_client_by_id(event.data.client_id)

      -- Configure mappgins
      local opts = { noremap = true, silent = true, buffer = buffer }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

      -- Enable document highlight
      if client and client.server_capabilities.documentHighlightProvider then
        local highlight_augroup = vim.api.nvim_create_augroup("rvim-lsp-highlight", {})

        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.clear_references,
        })
      end
    end,
  })

  -- Autocommand LspDetach
  vim.api.nvim_create_autocmd("LspDetach", {
    group = vim.api.nvim_create_augroup("rvim-lsp-detach", {}),
    callback = function(event)
      vim.lsp.buf.clear_references()
      vim.api.nvim_clear_autocmds({
        group = "rvim-lsp-detach",
        buffer = event.buf,
      })
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
