return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>h"] = { name = "+http" },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "hurl" })
    end,
  },
  {
    "jellydn/hurl.nvim", 
    ft = "hurl",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    opts = {
      env_file = { "hurl.env" },
      mode = "split",
      auto_close = false,
      debug = true,
      show_notification = true,
      formatters = {
        json = { "jq" },
        html = {
          "prettier",
          "--parser",
          "html",
        },
      },
    },
    keys = {
      -- Run API request
      { "<leader>hA", "<cmd>HurlRunner<CR>", desc = "Hurl - Run All requests" },
      { "<leader>hh", "<cmd>HurlRunnerAt<CR>", desc = "Hurl - Run Api request" },
      { "<leader>he", "<cmd>HurlRunnerToEntry<CR>", desc = "Hurl - Run Api request to entry" },
      { "<leader>tm", "<cmd>HurlToggleMode<CR>", desc = "Hurl - Toggle Mode" },
      { "<leader>hv", "<cmd>HurlVerbose<CR>", desc = "Hurl - Run Api in verbose mode" },
      -- Run Hurl request in visual mode
      { "<leader>hh", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
      -- Manage variable
      { "<leader>hg", ":HurlSetVariable", desc = "Hurl - Set global variable" },
      { "<leader>hf", ":HurlSetEnvFile", desc = "Hurl - Set file variable" },
      { "<leader>hG", "<cmd>HurlManageVariable<CR>", desc = "Hurl - Manage global variable" },
    },
  },
}
