local function map(mode, rhs, lhs, opts)
  vim.keymap.set(mode, rhs, lhs, opts)
end

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- Save file
map("n", "<leader>s", "<cmd>write<cr>")

-- Close file
map("n", "<leader>x", function()
  require("rvim.util").close_buffer()
end)

-- Better Up/Down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>h")

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- Move Lines
map("n", "<A-j>", ":m .+1<cr>==")
map("v", "<A-j>", ":m '>+1<cr>gv=gv")
map("i", "<A-j>", "<Esc>:m .+1<cr>==gi")
map("n", "<A-k>", ":m .-2<cr>==")
map("v", "<A-k>", ":m '<-2<cr>gv=gv")
map("i", "<A-k>", "<Esc>:m .-2<cr>==gi")

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Quit all
map("n", "<leader>qq", "<cmd>qa<cr>")
