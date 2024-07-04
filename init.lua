if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("utils.debug").dump(...)
end
vim.print = _G.dd

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
