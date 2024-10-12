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
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = LazyVim.config.icons

      vim.o.laststatus = vim.g.lualine_laststatus
      local function custom_mode()
        -- Retrieve the current mode
        local mode_map = {
          ["n"] = "N", -- Normal
          ["no"] = "N", -- Operator-pending
          ["v"] = "V", -- Visual
          ["V"] = "L", -- Visual Line
          [""] = "B", -- Visual Block (represented as ^V in code but B in map)
          ["i"] = "I", -- Insert
          ["ic"] = "I", -- Insert (completion)
          ["R"] = "R", -- Replace
          ["Rv"] = "V", -- Virtual Replace
          ["c"] = "C", -- Command
          ["cv"] = "E", -- Vim Ex
          ["ce"] = "E", -- Normal Ex
          ["r"] = "H", -- Hit-enter
          ["rm"] = "M", -- More
          ["r?"] = "?", -- Confirm
          ["!"] = "S", -- Shell
          ["t"] = "T", -- Terminal
        }

        -- Get the current mode from vim
        local mode = vim.fn.mode()
        -- Return custom string or default to the mode name if not mapped
        return mode_map[mode] or mode:upper()
      end

      local opts = {
        options = {
          -- theme = "auto",
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
          icons_enabled = true,
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
          tabline = {},
          extensions = {},
        },
        sections = {
          lualine_a = { custom_mode },
          lualine_b = {
            "branch",
            {
              "diff",
            },
          },

          lualine_c = {
            LazyVim.lualine.root_dir(),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
          },
          lualine_x = {},
          lualine_y = {
            "encoding",
            "filetype",
          },
          lualine_z = {},
        },
        extensions = { "neo-tree", "lazy" },
      }
      return opts
    end,
  },
}
