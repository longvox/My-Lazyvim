-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
--
--
--
-- Disable swapfile
vim.opt.swapfile = false

-- Disable backup
vim.opt.backup = false

-- Disable writebackup
vim.opt.writebackup = false
vim.opt.winbar = "%=%m %f"
vim.opt.grepprg = "rg --vimgrep --smart-case --"
vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.shortmess:append({ W = true, I = true, c = true })
vim.opt.showmode = false -- dont show mode since we have a statusline
vim.opt.listchars = "space:·,trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
vim.opt.pumblend = 10
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "120"

-- Enable line wrap, and make it so that long lines wrap smartly
vim.opt.wrap = true
vim.opt.showbreak = string.rep(" ", 3)
vim.opt.linebreak = true

vim.opt.swapfile = false

vim.opt.spell = false
-- disable some extension providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Set encoding to utf-8
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.g.autoformat = false -- globally
vim.b.autoformat = false -- buffer-local

-- disable some fanzy UI stuff when run in Neovide
if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_floating_blur = 0
  vim.g.neovide_floating_opacity = 90
  vim.opt.guifont = "FiraCode Nerd Font:h13"
  vim.cmd([[nnoremap <ScrollWheelRight> <Nop>]])
  vim.cmd([[nnoremap <ScrollWheelLeft> <Nop>]])
  vim.cmd([[nnoremap <S-ScrollWheelUp> <ScrollWheelRight>]])
  vim.cmd([[nnoremap <S-ScrollWheelDown> <ScrollWheelLeft>]])
end
