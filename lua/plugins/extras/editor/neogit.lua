return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
      "sindrets/diffview.nvim",
    },
    cmd = {
      "Neogit",
    },
    keys = {
      {
        "<leader>gn",
        "<cmd>Neogit<cr>",
        desc = "Neogit",
      },
      {
        "<leader>gd",
        function()
          if next(require("diffview.lib").views) == nil then
            vim.cmd("DiffviewOpen")
          else
            vim.cmd("DiffviewClose")
          end
        end,
        desc = "Toggle Diffview window",
      },
    },
    config = function()
      require("neogit").setup({
        disable_commit_confirmation = true,
        integrations = {
          diffview = true,
          telescope = true,
        },
        signs = {
          section = { "", "" },
          item = { "", "" },
          hunk = { "", "" },
        },
      })
    end,
  },
}
