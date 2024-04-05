return {
  -- disable catppuccin
  { "catppuccin/nvim", name = "catppuccin", enabled = false },

  -- configure tokyonight theme
  {
    "folke/tokyonight.nvim",
    optional = true,
    dependencies = {
      -- toggle theme
      {
        "eliseshaffer/darklight.nvim",
        opts = {
          mode = "colorscheme",
          dark_mode_colorscheme = "tokyonight-storm",
          light_mode_colorscheme = "tokyonight-day",
        },
      },
    },
  },

  -- notify customization
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "fade_in_slide_out",
      timeout = 3000,
      render = "compact",
    },
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
        color_icons = true,
        diagnostics = true,
        highlights = {
          buffer_selected = {
            gui = "none",
          },
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
          {
            filetype = "Outline",
            text = "Symbols Outline",
            highlight = "TSType",
            text_align = "left",
          },
        },
        custom_areas = {
          right = function()
            return { { text = " " .. os.date("%H:%M:%S") } }
          end,
        },
      },
    },
  },

  -- scrollbar for Neovim
  {
    "dstein64/nvim-scrollview",
    event = "BufReadPre",
    opts = {
      excluded_filetypes = { "alpha", "dashboard", "neo-tree" },
      current_only = true,
      winblend = 75,
    },
  },

  -- theme toggle
  {
    "eliseshaffer/darklight.nvim",
    event = "VimEnter",
    config = function(_, opts)
      require("darklight").setup(opts)
      local colorscheme = opts.dark_mode_colorscheme
      if vim.g.NV_UI_MODE ~= "light" then
        colorscheme = opts.light_mode_colorscheme
      end
      vim.cmd("colorscheme " .. colorscheme)
    end,
    keys = {
      {
        "<leader>um",
        function()
          if vim.o.background ~= "light" then
            vim.g.NV_UI_MODE = "dark"
          else
            vim.g.NV_UI_MODE = "light"
          end
          vim.cmd([[DarkLightSwitch]])
        end,
        desc = "Toggle Dark/Light mode",
      },
    },
  },

  -- project
  {
    "ahmedkhalf/project.nvim",
    optional = true,
    opts = function(_, opts)
      opts.manual_mode = false
      opts.detection_methods = { "lsp", "pattern" }
      opts.patterns = {
        ".git",
        ".hg",
        ".svn",
      }
    end,
  },
}
