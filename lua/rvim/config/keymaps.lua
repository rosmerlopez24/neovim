-- This file is automatically loaded.

local map = vim.api.nvim_set_keymap

-- Save current buffer to file
map("n", "<leader>s", "<cmd>w<cr><esc>", { desc = "Save File", silent = true, noremap = true })

-- Better Up/Down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map("n", "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map("n", "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", silent = true, noremap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", silent = true, noremap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", silent = true, noremap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", silent = true, noremap = true })

-- Move Lines
map(
  "n",
  "<A-j>",
  "<cmd>execute 'move .+' . v:count1<cr>==",
  { desc = "Move Down", silent = true, noremap = true }
)
map(
  "n",
  "<A-k>",
  "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==",
  { desc = "Move Up", silent = true, noremap = true }
)
map(
  "v",
  "<A-j>",
  ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",
  { desc = "Move Down", silent = true, noremap = true }
)
map(
  "v",
  "<A-k>",
  ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",
  { desc = "Move Up", silent = true, noremap = true }
)

-- Buffers
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer", silent = true, noremap = true })
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer", silent = true, noremap = true })
map(
  "n",
  "<leader>bd",
  "<cmd>:lua require('rvim.util').ui.buffer_delete()<cr>",
  { desc = "Delete Buffer", silent = true, noremap = true }
)
map(
  "n",
  "<leader>bD",
  "<cmd>:bd<cr>",
  { desc = "Delete Buffer and Window", silent = true, noremap = true }
)

-- Clear search with <esc>
map(
  "n",
  "<esc>",
  "<cmd>nohlsearch<cr><esc>",
  { desc = "Escape and Clear hlsearch", silent = true, noremap = true }
)

map("n", "n", "nzzzv", { desc = "Next Search Result", silent = true, noremap = true })
map("n", "N", "Nzzzv", { desc = "Prev Search Result", silent = true, noremap = true })

-- Better indenting
map("v", "<", "<gv", { desc = "Better indenting", silent = true, noremap = true })
map("v", ">", ">gv", { desc = "Better indenting", silent = true, noremap = true })

-- Quit all
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All", silent = true, noremap = true })
