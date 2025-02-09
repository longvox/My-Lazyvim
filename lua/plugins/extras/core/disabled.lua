return {
  -- notify disable
  {
    "folke/noice.nvim",
    opts = {
      notify = {
        enabled = false,
      },
    },
  },
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/neoconf.nvim", enabled = false },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    enabled = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

  {
    "stevearc/conform.nvim",
    enabled = false,
  },

  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "akinsho/toggleterm.nvim",
    enabled = false,
  },
  -- Disable mini buffer remove and use Snacks buffer delete instead
  {
    "echasnovski/mini.bufremove",
    enabled = false,
  },
  -- Disable mini cursor word and use Snacks words instead
  {
    "echasnovski/mini.cursorword",
    enabled = false,
  },
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },
  {
    "ggandor/flit.nvim",
    enabled = false,
  },
  {
    "nvim-neotest/neotest",
    enabled = false,
  },
  {
    "nvim-neotest/neotest-jest",
    enabled = false,
  },
  {
    "nvim-neotest/neotest-playwright",
    enabled = false,
  },
  {
    "nvim-neotest/neotest-python",
    enabled = false,
  },
  {
    "nvim-neotest/neotest-vitest",
    enabled = false,
  },
}
