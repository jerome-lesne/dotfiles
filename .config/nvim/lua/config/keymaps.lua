-- Key Remapping

-- Short function
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- move halfpage up/down
keymap("n", "K", "<C-u>", opts)
keymap("n", "J", "<C-d>", opts)

-- Move Up/down
-- keymap("n", "J", ":m +1<CR>==", opts)
-- keymap("n", "K", ":m -2<CR>==", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Move left/right
keymap("n", "H", "<<", opts)
keymap("n", "L", ">>", opts)
keymap("v", "L", ">gv", opts)
keymap("v", "H", "<gv", opts)

-- Better move between windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffers navigation
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
-- keymap("n", "<leader>q", ":bdelete<CR>", opts)

-- Open File explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Esc hlsearch
keymap("n", "<esc>", ":noh<cr>", opts)
