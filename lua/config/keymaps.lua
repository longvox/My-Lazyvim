-- Keymaps are automatically loaded on the VeryLazy event

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

if vim.fn.executable("btop") == 1 then
  -- btop
  map("n", "<leader>xb", function() end, { desc = "btop" })
end

map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

map('n', '(', ':tabprevious<CR>', { noremap = true, silent = true })
map('n', ')', ':tabnext<CR>', { noremap = true, silent = true })
map('n', '_', ':tabclose<CR>', { noremap = true, silent = true })
map('n', '+', ':tabnew<CR>', { noremap = true, silent = true })

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
map("n", "$", "k<NOP>")
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

map("n", "<leader>fx", require("telescope.builtin").resume, { noremap = true, silent = true, desc = "Resume" })

