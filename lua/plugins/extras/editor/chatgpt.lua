-- local map = vim.keymap.set
return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>a"] = { name = "+ChatGPT" },
      },
    },
  },

  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      local home = vim.fn.expand("$HOME")
      require("chatgpt").setup({
        api_key_cmd = "cat " .. home .. "/dotfiles/nvim/env/chatgpt.key.txt",
      })
    end,
    keys = {
      { "<leader>ap", "<cmd>ChatGPT<CR>", "ChatGPT" },
      { "<leader>ae", "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
      { "<leader>ag", "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
      { "<leader>at", "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
      { "<leader>ak", "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
      { "<leader>ad", "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
      { "<leader>aa", "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
      { "<leader>ao", "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
      { "<leader>as", "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
      { "<leader>af", "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
      { "<leader>ax", "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
      { "<leader>ar", "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
      {
        "<leader>al",
        "<cmd>ChatGPTRun code_readability_analysis<CR>",
        "Code Readability Analysis",
        mode = { "n", "v" },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
