-- Plugin: Lualine
-- https://github.com/rafi/vim-config

return {

  -----------------------------------------------------------------------------
  -- Statusline plugin written in pure lua
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    enabled = not vim.g.started_by_firenvim,
    init = function()
      vim.g.qf_disable_statusline = true
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      return {
        options = {
          icons_enabled = true,
          -- section_separators = { left = '', right = ''},
          -- component_separators = { left = '', right = ''},
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
        },
      }
    end,
  },
}
