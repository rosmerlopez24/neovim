---@class rvim.util.lsp
local M = {}

function M.setup_lsp_config()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("rvim-lsp-attach", { clear = true }),
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

      -- Setup LSP keybindings
      map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction")
      map("grr", vim.lsp.buf.references, "[G]oto [R]eferences")
      map("gri", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
      map("grd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      map("gO", vim.lsp.buf.document_symbol, "Open Document Symbols")
      map("gW", vim.lsp.buf.workspace_symbol, "Open Workspace Symbols")
      map("grt", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
      -- stylua: ignore start
      map("K", function() vim.lsp.buf.hover({ border = rvim.config.border }) end, "Open Hover")
      map("gK", function() vim.lsp.buf.signature_help({ border = rvim.config.border }) end, "Open Signature Help")
      -- stylua: ignore end
      map("<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")

      -- Setup LSP Document Highlight
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client:supports_method("textDocument/documentHighlight", event.buf) then
        local highlight_augroup =
          vim.api.nvim_create_augroup("rvim-lsp-highlight", { clear = false })
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

        vim.api.nvim_create_autocmd("LspDetach", {
          group = vim.api.nvim_create_augroup("rvim-lsp-detach", { clear = true }),
          callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({ group = "rvim-lsp-highlight", buffer = event2.buf })
          end,
        })
      end

      -- Setup Inlay Hint
      if client and client:supports_method("textDocument/inlayHint", event.buf) then
        map("<leader>th", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
        end, "[T]oggle Inlay [H]ints")
      end
    end,
  })
end

function M.setup_diagnostics_config()
  -- See :help vim.diagnostic.Opts
  ---@type vim.diagnostic.Opts
  local opts = {
    underline = true,
    update_in_insert = false,
    float = { border = "rounded", source = "if_many" },
    virtual_text = {
      spacing = 4,
      source = "if_many",
      prefix = "●",
    },
    severity_sort = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = rvim.config.icons.diagnostics.Error,
        [vim.diagnostic.severity.WARN] = rvim.config.icons.diagnostics.Warn,
        [vim.diagnostic.severity.HINT] = rvim.config.icons.diagnostics.Hint,
        [vim.diagnostic.severity.INFO] = rvim.config.icons.diagnostics.Info,
      },
    },
    jump = {
      on_jump = function(_, bufnr)
        vim.diagnostic.open_float({
          bufnr = bufnr,
          scope = "cursor",
          focus = false,
        })
      end,
    },
  }
  vim.diagnostic.config(opts)
end

return M
