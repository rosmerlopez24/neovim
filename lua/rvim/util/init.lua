local M = {}

-- Close buffer function
-- @param bufnr Current buffer
function M.close_buffer()
  -- If the buffer has been modified
  -- In case of modification, ask if you want to close
  -- In another case, close the buffer
  if vim.bo.modified then
    vim.ui.input({
      prompt = "You have unsaved changes. Quit anyway? (y/n) ",
    }, function(input)
      if input == "y" then
        vim.cmd([[bd!]])
      end
    end)
  else
    vim.cmd("bd" .. vim.api.nvim_get_current_buf())
  end
end

return M
