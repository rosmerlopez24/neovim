local opts = { silent = true, expr = false, noremap = true }

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", opts)

-- Save and close buffer
vim.keymap.set("n", "<leader>s", "<cmd>write<cr>", opts)
vim.keymap.set("n", "<leader>x", function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  vim.cmd("confirm bdelete" .. bufnr)
end, opts)

-- Better Up/Down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Move Lines
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", opts)
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<cr>==gi", opts)
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<cr>==gi", opts)

-- Better indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Quit all
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", opts)

-- Windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", opts)
vim.keymap.set("n", "<leader>wd", "<C-W>c", opts)
vim.keymap.set("n", "<leader>w-", "<C-W>s", opts)
vim.keymap.set("n", "<leader>w|", "<C-W>v", opts)
vim.keymap.set("n", "<leader>-", "<C-W>s", opts)
vim.keymap.set("n", "<leader>|", "<C-W>v", opts)

-- Tabs
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", opts)
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", opts)
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", opts)
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", opts)
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", opts)
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", opts)

-- Lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", opts)
