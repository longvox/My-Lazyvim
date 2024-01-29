return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  opts = {
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   pattern = "*.go",
    --   callback = function()
    --     require("go.format").goimport()
    --   end,
    --   -- group = vim.api.nvim_create_augroup("GoFormat", { "f" }),
    -- }),
  },
  keys = {

    {
      "<leader>cgh",
      function()
        require("go.godoc").run()
      end,
      desc = "Go Doc",
    },
  },
}
