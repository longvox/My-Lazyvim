-- Keymaps are automatically loaded on the VeryLazy event

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

local utils = require("utils.utils")

-- Remove some default keymaps

pcall(vim.api.nvim_del_keymap, "n", "<leader>K")
pcall(vim.api.nvim_del_keymap, "n", "<leader>l")
pcall(vim.api.nvim_del_keymap, "n", "<leader>L")
pcall(vim.api.nvim_del_keymap, "n", "<leader>E")
pcall(vim.api.nvim_del_keymap, "n", "<leader>R")
pcall(vim.api.nvim_del_keymap, "n", "<leader>/")
pcall(vim.api.nvim_del_keymap, "n", "<leader>`")
pcall(vim.api.nvim_del_keymap, "n", "<leader>?")
pcall(vim.api.nvim_del_keymap, "n", "<leader>gc")
pcall(vim.api.nvim_del_keymap, "n", "<leader>gb")
pcall(vim.api.nvim_del_keymap, "n", "<leader>gB")
pcall(vim.api.nvim_del_keymap, "n", "<leader>gs")
pcall(vim.api.nvim_del_keymap, "n", "<leader>:")
pcall(vim.api.nvim_del_keymap, "n", "<leader>,")

map("n", ";", ":")

map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })

map("n", "(", ":tabprevious<CR>", { noremap = true, silent = true })
map("n", ")", ":tabnext<CR>", { noremap = true, silent = true })
map("n", "_", ":tabclose<CR>", { noremap = true, silent = true })
map("n", "+", ":tabnew<CR>", { noremap = true, silent = true })

if vim.fn.has("macunix") then
  -- Move selected line / block of text in visual mode
  -- shift + k to move up
  -- shift + j to move down
  map("n", "<C-S-j>", "<cmd>m .+1<cr>==", { desc = "Move down", silent = true })
  map("n", "<C-S-k>", "<cmd>m .-2<cr>==", { desc = "Move up", silent = true })
  map("i", "<C-S-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down", silent = true })
  map("i", "<C-S-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up", silent = true })
  map("v", "<C-S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down", silent = true })
  map("v", "<C-S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up", silent = true })
end

if vim.g.vscode then
  -- Only map if that is inside vscode
  map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
  map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
  map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
  map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
end

map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Keep cursor in the center line when C-D / C-U
map("n", "<C-d>", "<C-d>zz", { silent = true })
map("n", "<C-u>", "<C-u>zz", { silent = true })

-- hack
map("n", "<up>", ":echoe \"please use 'k' key\"<CR>")
map("n", "<down>", ":echoe \"please use 'j' key\"<CR>")
map("n", "<left>", ":echoe \"please use 'h' key\"<CR>")
map("n", "<right>", ":echoe \"please use 'l' key\"<CR>")

-- map hl
map("n", "H", "h")
map("n", "L", "l")
map("n", "l", "w")
map("n", "h", "b")

-- map hjkl
map("v", "H", "h")
map("v", "L", "l")
map("v", "l", "w")
map("v", "h", "b")

-- move to begin/end of line
map("n", "b", "^")
map("n", "e", "$")

-- $/^ doesn't do anything
map("n", "$", "<NOP>")
map("n", "^", "<NOP>")
-- without yanking it
--
map("x", "p", '"_dP')
map("x", "P", '"0P')

-- delete without yanking
map("n", "d", '"_d')
map("n", "D", '"_D')
map("v", "d", '"_d')
map("v", "D", '"_D')

map("n", "c", '"_c')
map("n", "C", '"_C')
map("v", "c", '"_c')
map("v", "C", '"_C')

map("n", "U", "<CMD>redo<CR>", { desc = "Redo", noremap = true })

-- Select all text in buffer with Alt-a
map("n", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })

map("n", "z0", "1z=", {
  desc = "Fix world under cursor",
})

map(
  "n",
  ",",
  "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
  { noremap = true, silent = true, desc = "Switch Bufffer" }
)

-- Define Name group which-key
map("n", "<leader>ct", "<CMD>NOP<CR>", { desc = "Set Indent", noremap = true, silent = true })

map("n", "<leader>gd", function()
  utils.telescope_diff_from_history()
end, { desc = "Diff from git history" })
map("n", "<leader>gD", function()
  utils.telescope_diff_file()
end, { desc = "Diff file with current buffer" })

-- Mixed mode: half-tabs-are-spaces
map(
  "n",
  "<leader>ctM",
  ":set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>",
  { noremap = true, silent = true, desc = "Mixed Mode: Half-tabs, Half-spaces" }
)
-- Mini tabs, small "m"
map(
  "n",
  "<leader>ctm",
  ":set expandtab tabstop=2 shiftwidth=2<CR>",
  { noremap = true, silent = true, desc = "Mini Tabs (2 spaces)" }
)
-- Little tabs
map(
  "n",
  "<leader>ctt",
  ":set expandtab tabstop=4 shiftwidth=4<CR>",
  { noremap = true, silent = true, desc = "Little Tabs (4 spaces)" }
)
-- Big tabs
map(
  "n",
  "<leader>ctT",
  ":set expandtab tabstop=8 shiftwidth=8<CR>",
  { noremap = true, silent = true, desc = "Big Tabs (8 spaces)" }
)
map("n", "<leader>fx", require("telescope.builtin").resume, { noremap = true, silent = true, desc = "Resume" })

-- Author: Karl Yngve Lervåg
--    See: https://github.com/lervag/dotnvim

-- Close all fold except the current one.
map("n", "zv", "zMzvzz", {
  desc = "Close all folds except the current one",
})

-- Close current fold when open. Always open next fold.
map("n", "zj", "zcjzOzz", {
  desc = "Close current fold when open. Always open next fold.",
})

-- Close current fold when open. Always open previous fold.
map("n", "zk", "zckzOzz", {
  desc = "Close current fold when open. Always open previous fold.",
})
