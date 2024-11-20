-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
--

-- Hide deprecation warnings
local opt = vim.opt
local global = vim.g
local buffer = vim.b
local cmd = vim.cmd

-- disable some extension providers
global.loaded_python3_provider = 0
global.loaded_ruby_provider = 0
global.loaded_node_provider = 0
global.loaded_perl_provider = 0

global.lazyvim_php_lsp = "intelephense"

global.autoformat = false -- globally
buffer.autoformat = false -- buffer-local

-- disable some fanzy UI stuff when run in Neovide
if global.neovide then
  global.neovide_cursor_animation_length = 0
  global.neovide_floating_blur = 0
  global.neovide_floating_opacity = 90
  global.neovide_hide_mouse_when_typing = true
  global.neovide_cursor_antialiasing = false
  global.neovide_input_macos_option_key_is_meta = "only_left"
  global.neovide_input_ime = true
  opt.guifont = "FiraCode Nerd Font:h13"
  cmd([[nnoremap <ScrollWheelRight> <Nop>]])
  cmd([[nnoremap <ScrollWheelLeft> <Nop>]])
  cmd([[nnoremap <S-ScrollWheelUp> <ScrollWheelRight>]])
  cmd([[nnoremap <S-ScrollWheelDown> <ScrollWheelLeft>]])
end

-- Fix markdown indentation settings
global.markdown_recommended_style = 0

global.deprecation_warnings = false

-- hidden diagnostic
vim.diagnostic.enable(false)

-- Set encoding to utf-8
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Disable swapfile
opt.swapfile = false

-- Disable backup
opt.backup = false

-- Disable writebackup
opt.writebackup = false

opt.winbar = "%=%m %f"
opt.hidden = true -- Enable modified buffers in background
opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 0
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep --smart-case --"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.listchars = "space:·,trail:█,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.colorcolumn = "120"
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.spelloptions:append("noplainbuffer")
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.fileformat = "unix"

-- Enable line wrap, and make it so that long lines wrap smartly
opt.wrap = true
opt.showbreak = string.rep(" ", 3)
opt.linebreak = true
opt.spell = false

-- Folding
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldlevel = 99
if vim.fn.has("nvim-0.10") == 1 or vim.fn.has("nvim-0.11") then
  opt.smoothscroll = true
  opt.foldexpr = "v:lua.require'utils.ui'.foldexpr()"
  opt.foldmethod = "expr"
  opt.foldtext = ""
else
  opt.foldmethod = "indent"
  opt.foldtext = "v:lua.require'utils.ui'.foldtext()"
end

-- Enable spell check by default unless in vscode
if not global.vscode then
  vim.o.spell = true
end

