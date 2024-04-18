-- Commands
local commandsPicker = nil
local ToggleCommands = function()
  local telescope = require("telescope.builtin")
  local telescope_state = require("telescope.state")
  if commandsPicker == nil then
    telescope.commands()
    local cached_pickers = telescope_state.get_global_key("cached_pickers") or {}
    commandsPicker = cached_pickers[1]
  else
    telescope.resume({ picker = commandsPicker })
  end
end
vim.api.nvim_create_user_command("ToggleCommands", ToggleCommands, { desc = "Toggle commands" })

-- Files
local filesPicker = nil
local ToggleFiles = function()
  local telescope = require("telescope.builtin")
  local telescope_state = require("telescope.state")
  if filesPicker == nil then
    telescope.find_files()
    local cached_pickers = telescope_state.get_global_key("cached_pickers") or {}
    filesPicker = cached_pickers[1]
  else
    telescope.resume({ picker = filesPicker })
  end
end
vim.api.nvim_create_user_command("ToggleFiles", ToggleFiles, { desc = "Toggle files" })

return {
  -- customize file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      window = {
        position = "right",
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
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
      },

      source_selector = {
        winbar = true,
        statusline = true,
        sources = {
          { source = "filesystem", display_name = " 󰉓 File " },
          { source = "git_status", display_name = " 󰊢 Git " },
          { source = "buffers", display_name = " 󰓩 Buf " },
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
        prompt_prefix = " ",
        selection_caret = " ",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            preview_cutoff = 0.2,
            preview_width = 0.5,
          },
          height = 0.9,
          width = 0.9,
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
  {
    "kkoomen/vim-doge",
    build = ":call doge#install()",
    init = function()
      vim.g.doge_enable_mappings = 0
      vim.g.doge_mapping = "<leader>ci"
      vim.g.doge_doc_standard_python = "numpy" ---@type "numpy"|"google"|"sphinx"|"reST"|"doxygen"
      vim.g.doge_doc_standard_javascript = "jsdoc"
      vim.g.doge_doc_standard_rust = "rustdoc"
      vim.g.doge_doc_standard_lua = "luadoc"
      vim.g.doge_doc_standard_vim = "vimdoc"
      vim.g.doge_doc_standard_cpp = "doxygen"
      vim.g.doge_doc_standard_c = "doxygen"
      vim.g.doge_doc_standard_shell = "shell"
      vim.g.doge_doc_standard_fish = "fish"
      vim.g.doge_doc_standard_haskell = "haddock"
      vim.g.doge_doc_standard_nix = "nixdoc"
      vim.g.doge_doc_standard_ocaml = "ocamldoc"
      vim.g.doge_doc_standard_purescript = "purescript"
      vim.g.doge_doc_standard_reason = "reason"
      vim.g.doge_doc_standard_svelte = "sveltedoc"
      vim.g.doge_doc_standard_typescript = "tsdoc"
      vim.g.doge_doc_standard_vue = "vuedoc"
      vim.g.doge_doc_standard_yaml = "yamldoc"
      vim.g.doge_doc_standard_zig = "zigdoc"
      vim.g.doge_doc_standard_clojure = "clojuredoc"
      vim.g.doge_doc_standard_clojurescript = "clojuredoc"
      vim.g.doge_doc_standard_fennel = "fenneldoc"
    end,
    keys = {
      { "<leader>ci", "<Plug>(doge-generate)", desc = "Docs generate" },
    },
  },
}
