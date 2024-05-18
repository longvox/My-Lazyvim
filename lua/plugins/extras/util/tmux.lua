return {
  "alexghergh/nvim-tmux-navigation",
  event = "VeryLazy",
  config = function()
    local nvim_tmux_nav = require("nvim-tmux-navigation")
    nvim_tmux_nav.setup({
      disable_when_zoomed = true,
      -- defaults to false
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
      },
    })
  end,

  keys = {
    { "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", silent = true },
    { "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", silent = true },
    { "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", silent = true },
    { "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", silent = true },
    { "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", silent = true },
  },
}
