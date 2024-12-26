return {
  -- customize file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      window = {
        position = "left",
        mappings = {
          ["<space>"] = "none",
          ["l"] = "open",
          ["h"] = "close_node",
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every
        },
        -- time the current file is changed while the tree is open.
        group_empty_dirs = false, -- when true, empty folders will be grouped together
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
      },

      source_selector = {
        winbar = true,
        statusline = true,
        sources = {
          { source = "filesystem", display_name = " 󰉓 File " },
          { source = "git_status", display_name = " 󰊢 Git " },
        },
        content_layout = "center",
      },
    },
  },

  -- customize telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        -- layout_strategy = "vertical",
        -- layout_config = {
        --   horizontal = {
        --     preview_cutoff = 0.2,
        --     preview_width = 0.5,
        --   },
        --   height = 0.7,
        --   width = 0.5,
        -- },
        prompt_title = "",
        results_title = "",
        preview_title = "",
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = " ",
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            width = 120,
            preview_height = 0.7,
          },
        },
        mappings = {
          i = {
            ["<C-j>"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,
            ["<C-k>"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,
            ["<C-p>"] = function(...)
              return require("telescope.actions.layout").toggle_preview(...)
            end,
          },
          n = {
            ["j"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,
            ["k"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,
            ["gg"] = function(...)
              return require("telescope.actions").move_to_top(...)
            end,
            ["G"] = function(...)
              return require("telescope.actions").move_to_bottom(...)
            end,
            ["<C-p>"] = function(...)
              return require("telescope.actions.layout").toggle_preview(...)
            end,
          },
        },
      },
    },
  },

  { "nmac427/guess-indent.nvim", lazy = false, priority = 50, config = true },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load({ path = "~/.config/nvim/snippets" })
    end,
  }
}
