return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {},
      },
    },
  },
  -- Markdown
  {
    "lukas-reineke/headlines.nvim",
    opts = function()
      local opts = {}
      for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
        opts[ft] = { headline_highlights = {} }
        for i = 1, 6 do
          table.insert(opts[ft].headline_highlights, "Headline" .. i)
        end
      end
      return opts
    end,
    ft = { "markdown", "norg", "rmd", "org" },
  },
  -- Markdown preview
  {
    "previm/previm",
    config = function()
      -- define global for open markdown preview, let g:previm_open_cmd = 'open -a Safari'
      vim.g.previm_open_cmd = "open -a Arc"
    end,
    ft = { "markdown" },
    keys = {
      -- add <leader>mp to open markdown preview
      { "<leader>cp", "<cmd>PrevimOpen<cr>", desc = "Markdown preview" },
    },
  },
}
