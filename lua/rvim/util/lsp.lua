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

return M
