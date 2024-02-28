-- Keymaps are automatically loaded on the VeryLazy event

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

if vim.fn.executable("btop") == 1 then
  -- btop
  map("n", "<leader>xb", function() end, { desc = "btop" })
  require("lazyvim.util").terminal.open({ "btop" }, { esc_esc = false, ctrl_hjkl = false })
end


if vim.g.vscode then
  -- Save/Quit
  map("n", "<leader>w", [[<cmd>call VSCodeNotify('workbench.action.files.save')<cr>]])
  map("n", "<leader>q", [[<cmd>call VSCodeNotify('workbench.action.closeWindow')<cr>]])
  -- Flash
  map("n", "s", "<leader><leader>/")
  map("n", "S", "<leader><leader><leader>j")
  -- Move down/up
  map("n", "<C-S-j>", [[<cmd>call VSCodeNotify('editor.action.moveLinesDownAction')<cr>]])
  map("n", "<C-S-k>", [[<cmd>call VSCodeNotify('editor.action.moveLinesWordAction')<cr>]])
  -- Prev/Next buffer
  map("n", "<S-Tab>", "<cmd>bprev<cr>")
  map("n", "<Tab>", "<cmd>bnext<cr>")
  -- Reload window
  map("n", "<leader>ur", [[<cmd>call VSCodeNotify('workbench.action.reloadWindow')<cr>]])
  map("n", "gw", "*")
  -- Lazy
  map("n", "<leader>l", [[<cmd>call VSCodeNotify('workbench.view.extensions')<cr>]])
  map("n", "<leader>l", [[<cmd>call VSCodeNotify('workbench.action.reloadWindow')<cr>]])
  -- New File
  map("n", "<leader>fn", [[<cmd>call VSCodeNotify('workbench.action.files.newUntitledFile')<cr>]])
  -- Toggle Word Wrap
  map("n", "<leader>uw", [[<cmd>call VSCodeNotify('workbench.action.toggleWordWrap')<cr>]])
  -- Open git
  map("n", "<leader>gg", [[<cmd>call VSCodeNotify('workbench.view.scm')<cr>]])
  -- Quit all
  map("n", "<leader>qq", [[<cmd>call VSCodeNotify('workbench.actio.quit')<cr>]])
  -- LazyVim Changelog
  map("n", "<leader>L", [[<cmd>call VSCodeNotify('update.showCurrentReleaseNotes')<cr>]])
  -- Terminal
  map("n", "<leader>ft", [[<cmd>call VSCodeNotify('workbench.action.createTerminalEditor')<cr>]])
  -- LSP
  -- Line Diagnostics
  map("n", "<leader>cd", [[<cmd>call VSCodeNotify('editor.action.showHover')<cr>]])
  -- LSP info
  map("n", "<leader>cl", [[<cmd>call VSCodeNotify('workbench.action.output.toggleOutput')<cr>]])
  -- Goto Definition
  map("n", "gd", [[<cmd>call VSCodeNotify('editor.action.revealDefinition')<cr>]])
  -- References
  map("n", "gr", [[<cmd>call VSCodeNotify('editor.action.goToReferences')<cr>]])
  -- Goto Declaration
  map("n", "gD", [[<cmd>call VSCodeNotify('editor.action.revealDeclaration')<cr>]])
  -- Goto Implementation
  map("n", "gI", [[<cmd>call VSCodeNotify('editor.action.goToImplementation')<cr>]])
  -- Goto Type Definition
  map("n", "gy", [[<cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<cr>]])
  -- Hover
  map("n", "K", [[<cmd>call VSCodeNotify('editor.action.showHover')<cr>]])
  -- Signature Help
  map("n", "gK", [[<cmd>call VSCodeNotify('editor.action.triggerParameterHints')<cr>]])
  map("n", "<C-k>", [[<cmd>call VSCodeNotify('editor.action.triggerParameterHints')<cr>]])
  -- Next Diagnostic
  map("n", "]d", [[<cmd>call VSCodeNotify('editor.action.marker.next')<cr>]])
  -- Prev Diagnostic
  map("n", "[d", [[<cmd>call VSCodeNotify('editor.action.marker.prev')<cr>]])
  -- Next Error
  map("n", "]e", [[<cmd>call VSCodeNotify('editor.action.marker.next')<cr>]])
  -- Prev Error
  map("n", "[e", [[<cmd>call VSCodeNotify('editor.action.marker.prev')<cr>]])
  -- Next Warning
  map("n", "]w", [[<cmd>call VSCodeNotify('editor.action.marker.next')<cr>]])
  -- Prev Warning
  map("n", "[w", [[<cmd>call VSCodeNotify('editor.action.marker.prev')<cr>]])
  -- Format Document
  map("n", "<leader>cf", [[<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>]])
  -- Code Action
  map("n", "<leader>ca", [[<cmd>call VSCodeNotify('editor.action.quickFix')<cr>]])
  -- Source Action
  map("n", "<leader>cA", [[<cmd>call VSCodeNotify('editor.action.quickFix')<cr>]])
  -- Rename
  map("n", "<leader>cr", [[<cmd>call VSCodeNotify('editor.action.rename')<cr>]])

  -- BUFFERLINE.NVIM
  -- Toggle pin (pin)
  map("n", "<leader>bp", [[<cmd>call VSCodeNotify('workbench.action.pinEditor')<cr>]])
  -- Toggle pin (unpin)
  map("n", "<leader>bu", [[<cmd>call VSCodeNotify('workbench.action.unpinEditor')<cr>]])
  -- Delete non-pinned buffers
  map("n", "<leader>bP", [[<cmd>call VSCodeNotify('workbench.action.closeAllEditors')<cr>]])

  -- NEO-TREE.NVIM
  -- Explorer NeoTree (root dir)
  map("n", "<leader>fe", [[<cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<cr>]])
  -- Explorer NeoTree (cwd)
  map("n", "<leader>fE", [[<cmd>call VSCodeNotify('workbench.explorer.fileView.toggleVisibility')<cr>]])
  -- Explorer NeoTree (root dir)
  map("n", "<leader>e", [[<cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<cr>]])
  -- Explorer NeoTree (cwd)
  map("n", "<leader>E", [[<cmd>call VSCodeNotify('workbench.explorer.fileView.toggleVisibility')<cr>]])
  -- Noice Last Message
  map("n", "<leader>snl", [[<cmd>call VSCodeNotify('workbench.action.output.toggleOutput')<cr>]])
  -- Noice History
  map("n", "<leader>snh", [[<cmd>call VSCodeNotify('workbench.action.output.toggleOutput')<cr>]])
  -- Noice All
  map("n", "<leader>sna", [[<cmd>call VSCodeNotify('workbench.action.output.toggleOutput')<cr>]])

  -- NVIM-SPECTRE
  -- Replace in files (Spectre)
  map("n", "<leader>sr", [[<cmd>call VSCodeNotify('editor.action.startFindReplaceAction')<cr>]])

  -- TELESCOPE.NVIM
  -- Grep (root dir)
  map("n", "<leader>/", [[<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>]])
  -- Find Files (root dir)
  map("n", "<leader><space>", [[<cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>]])
  -- Buffers
  map("n", "<leader>fb", [[<cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>]])
  -- Find Files (root dir)
  map("n", "<leader>ff", [[<cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>]])
  -- Find Files (cwd)
  map("n", "<leader>fF", [[<cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>]])
  -- Recent
  map("n", "<leader>fr", [[<cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>]])
  -- Recent (cwd)
  map("n", "<leader>fR", [[<cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>]])
  -- Commits
  map("n", "<leader>gc", [[<cmd>call VSCodeNotify('workbench.view.scm')<cr>]])
  -- Status
  map("n", "<leader>gs", [[<cmd>call VSCodeNotify('workbench.view.scm')<cr>]])
  -- Buffer
  map("n", "<leader>sb", [[<cmd>call VSCodeNotify('editor.action.startFindReplaceAction')<cr>]])
  -- Commands
  map("n", "<leader>sC", [[<cmd>call VSCodeNotify('workbench.action.showCommands')<cr>]])
  -- Document diagnostics
  map("n", "<leader>sd", [[<cmd>call VSCodeNotify('workbench.actions.view.problems')<cr>]])
  -- Workspace diagnostics
  map("n", "<leader>sD", [[<cmd>call VSCodeNotify('workbench.actions.view.problems')<cr>]])
  -- Grep (root dir)
  map("n", "<leader>sg", [[<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>]])
    -- LSP
  -- Line Diagnostics
  map('n', '<leader>cd', [[<cmd>call VSCodeNotify('execute "editor.action.showHover"')<CR>]])
  -- LSP info
  map('n', '<leader>cl', [[<cmd>call VSCodeNotify('execute "workbench.action.output.toggleOutput"')<CR>]])
  -- Goto Definition
  map('n', 'gd', [[<cmd>call VSCodeNotify('execute "editor.action.revealDefinition"')<CR>]])
  -- References
  map('n', 'gr', [[<cmd>call VSCodeNotify('execute "editor.action.goToReferences"')<CR>]])
  -- Goto Declaration
  map('n', 'gD', [[<cmd>call VSCodeNotify('execute "editor.action.revealDeclaration"')<CR>]])
  -- Goto Implementation
  map('n', 'gI', [[<cmd>call VSCodeNotify('execute "editor.action.goToImplementation"')<CR>]])
  -- Goto Type Definition
  map('n', 'gy', [[<cmd>call VSCodeNotify('execute "editor.action.goToTypeDefinition"')<CR>]])
  -- Hover
  map('n', 'K', [[<cmd>call VSCodeNotify('execute "editor.action.showHover"')<CR>]])
  -- Signature Help
  map('n', 'gK', [[<cmd>call VSCodeNotify('execute "editor.action.triggerParameterHints"')<CR>]])
  map('n', '<C-k>', [[<cmd>call VSCodeNotify('execute "editor.action.triggerParameterHints"')<CR>]])
  -- Next Diagnostic
  map('n', ']d', [[<cmd>call VSCodeNotify('execute "editor.action.marker.next"')<CR>]])
  -- Prev Diagnostic
  map('n', '[d', [[<cmd>call VSCodeNotify('execute "editor.action.marker.prev"')<CR>]])
  -- Next Error
  map('n', ']e', [[<cmd>call VSCodeNotify('execute "editor.action.marker.next"')<CR>]])
  -- Prev Error
  map('n', '[e', [[<cmd>call VSCodeNotify('execute "editor.action.marker.prev"')<CR>]])
  -- Next Warning
  map('n', ']w', [[<cmd>call VSCodeNotify('execute "editor.action.marker.next"')<CR>]])
  -- Prev Warning
  map('n', '[w', [[<cmd>call VSCodeNotify('execute "editor.action.marker.prev"')<CR>]])
  -- Format Document
  map('n', '<leader>cf', [[<cmd>call VSCodeNotify('execute "editor.action.formatDocument"')<CR>]])
  -- Code Action
  map('n', '<leader>ca', [[<cmd>call VSCodeNotify('execute "editor.action.quickFix"')<CR>]])
  -- Source Action
  map('n', '<leader>cA', [[<cmd>call VSCodeNotify('execute "editor.action.quickFix"')<CR>]])
  -- Rename
  map('n', '<leader>cr', [[<cmd>call VSCodeNotify('execute "editor.action.rename"')<CR>]])

  -- BUFFERLINE.NVIM
  -- Toggle pin
  -- NOTE: Separate commands required due to VSCode limitations
  -- pin
  map('n', '<leader>bp', [[<cmd>call VSCodeNotify('execute "workbench.action.pinEditor"')<CR>]], { noremap = true, silent = true, expr = false })
  -- Toggle pin
  -- NOTE: Separate commands required due to VSCode limitations
  -- unpin
  map('n', '<leader>bu', [[<cmd>call VSCodeNotify('execute "workbench.action.unpinEditor"')<CR>]], { noremap = true, silent = true, expr = false })
  -- Delete non-pinned buffers
  map('n', '<leader>bP', [[<cmd>call VSCodeNotify('execute "workbench.action.closeAllEditors"')<CR>]], { noremap = true, silent = true, expr = false })

  -- NEO-TREE.NVIM
  -- Explorer NeoTree (root dir)
  map('n', '<leader>fe', [[<cmd>call VSCodeNotify('execute "workbench.files.action.showActiveFileInExplorer"')<CR>]])
  -- Explorer NeoTree (cwd)
  map('n', '<leader>fE', [[<cmd>call VSCodeNotify('execute "workbench.explorer.fileView.toggleVisibility"')<CR>]])
  -- Explorer NeoTree (root dir)
  map('n', '<leader>e', [[<cmd>call VSCodeNotify('execute "workbench.files.action.showActiveFileInExplorer"')<CR>]])
  -- Explorer NeoTree (cwd)
  map('n', '<leader>E', [[<cmd>call VSCodeNotify('execute "workbench.explorer.fileView.toggleVisibility"')<CR>]])
  -- Noice Last Message
  -- Noice History
  map('n', '<leader>snh', [[<cmd>call VSCodeNotify('execute "workbench.action.output.toggleOutput"')<CR>]])
  -- Noice All
  map('n', '<leader>sna', [[<cmd>call VSCodeNotify('execute "workbench.action.output.toggleOutput"')<CR>]])

  -- NVIM-SPECTRE
  -- Replace in files (Spectre)
  map('n', '<leader>sr', [[<cmd>call VSCodeNotify('execute "editor.action.startFindReplaceAction"')<CR>]])

  -- TELESCOPE.NVIM
  -- Grep (root dir)
  map('n', '<leader>/', [[<cmd>call VSCodeNotify('execute "workbench.action.findInFiles"')<CR>]])
  -- Find Files (root dir)
  map('n', '<leader><space>', [[<cmd>call VSCodeNotify('execute "workbench.action.quickOpen"')<CR>]])
  -- Buffers
  map('n', '<leader>fb', [[<cmd>call VSCodeNotify('execute "workbench.action.quickOpen"')<CR>]])
  -- Find Files (root dir)
  map('n', '<leader>ff', [[<cmd>call VSCodeNotify('execute "workbench.action.quickOpen"')<CR>]])
  -- Find Files (cwd)
  map('n', '<leader>fF', [[<cmd>call VSCodeNotify('execute "workbench.action.quickOpen"')<CR>]])
  -- Recent
  map('n', '<leader>fr', [[<cmd>call VSCodeNotify('execute "workbench.action.quickOpen"')<CR>]])
  -- Recent (cwd)
  map('n', '<leader>fR', [[<cmd>call VSCodeNotify('execute "workbench.action.quickOpen"')<CR>]])
  -- Commits
  map('n', '<leader>gc', [[<cmd>call VSCodeNotify('execute "workbench.view.scm"')<CR>]], { noremap = true, silent = true, expr = false })
  -- Status
  map('n', '<leader>gs', [[<cmd>call VSCodeNotify('execute "workbench.view.scm"')<CR>]], { noremap = true, silent = true, expr = false })
  -- Buffer
  map('n', '<leader>sb', [[<cmd>call VSCodeNotify('execute "editor.action.startFindReplaceAction"')<CR>]])
  -- Commands
  map('n', '<leader>sC', [[<cmd>call VSCodeNotify('execute "workbench.action.showCommands"')<CR>]])
  -- Document diagnostics
  map('n', '<leader>sd', [[<cmd>call VSCodeNotify('execute "workbench.actions.view.problems"')<CR>]], { noremap = true, silent = true, expr = false })
  -- Workspace diagnostics
  map('n', '<leader>sD', [[<cmd>call VSCodeNotify('execute "workbench.actions.view.problems"')<CR>]], { noremap = true, silent = true, expr = false })
  -- Grep (root dir)
  map('n', '<leader>sg', [[<cmd>call VSCodeNotify('execute "workbench.action.findInFiles"')<CR>]])
  -- Help Pages
  map('n', '<leader>sh', [[<cmd>call VSCodeNotify('execute "workbench.action.openDocumentationUrl"')<CR>]])
  -- Key Maps
  map('n', '<leader>sk', [[<cmd>call VSCodeNotify('execute "workbench.action.showCommands"')<CR>]])
  -- Colorscheme with preview
  map('n', '<leader>uC', [[<cmd>call VSCodeNotify('execute "workbench.action.selectTheme"')<CR>]])
else
  map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

  if vim.fn.has('macunix') then
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


