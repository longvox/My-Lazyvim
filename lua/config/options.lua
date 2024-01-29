-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
--
--
vim.opt.winbar = "%=%m %f"
vim.opt.grepprg = "rg --vimgrep --smart-case --"
vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.shortmess:append({ W = true, I = true, c = true })
vim.opt.showmode = false -- dont show mode since we have a statusline
vim.opt.listchars = "space:·,trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
vim.opt.pumblend = 10

vim.opt.swapfile = false

-- disable some extension providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.autoformat = false -- globally

vim.api.nvim_command('setlocal keymap=vietnamese-telex_utf-8')

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
