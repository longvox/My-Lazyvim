return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "echo $OPENAI_API_KEY"
      })
    end,
    keys = {
      { "<leader>ch" , decs = "ChatGPT", mode = { "n", "v" } },
      { "<leader>chp", "<cmd>ChatGPT<CR>", "ChatGPT" },
      { "<leader>che", "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
      { "<leader>chg", "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
      { "<leader>cht", "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
      { "<leader>chk", "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
      { "<leader>chd", "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
      { "<leader>cha", "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
      { "<leader>cho", "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
      { "<leader>chs", "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
      { "<leader>chf", "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
      { "<leader>chx", "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
      { "<leader>chr", "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
      { "<leader>chl", "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" }, },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
