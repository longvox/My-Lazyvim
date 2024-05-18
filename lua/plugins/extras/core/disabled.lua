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
}
