return {
  -- disable catppuccin
  { "catppuccin/nvim", name = "catppuccin", enabled = false },

  -- configure tokyonight theme
  {
    "folke/tokyonight.nvim",
  },
  
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },

  {
    "ntpeters/vim-better-whitespace",
    event = "VeryLazy",
    config = function()
      vim.g.better_whitespace_guicolor = "gray"
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_only_modified_lines = 1
      vim.g.strip_whitespace_on_save = 0
      vim.g.strip_whitespace_confirm = 0
    end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    opts = {
      options = {
        numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        max_name_length = 20,
        max_prefix_length = 20, -- prefix used when a buffer is de-duplicated
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = true,
        show_tab_indicators = true,
        enforce_regular_tabs = true,
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
        always_show_bufferline = true,
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
