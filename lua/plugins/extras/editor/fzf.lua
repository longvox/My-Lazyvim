local Lsp = require("utils.lsp")

local function symbols_filter(entry, ctx)
  if ctx.symbols_filter == nil then
    ctx.symbols_filter = Lsp.get_kind_filter(ctx.bufnr) or false
  end
  if ctx.symbols_filter == false then
    return true
  end
  return vim.tbl_contains(ctx.symbols_filter, entry.kind)
end

return {
  {
    "ahmedkhalf/project.nvim",
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      hls = {
        border = "FloatBorder",
        cursorline = "Visual",
        cursorlinenr = "Visual",
        backdrop = "FzfLuaBackdrop",
      },
      fzf_colors = true,
      -- History file
      fzf_opts = {
        ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-history",
        ["--info"] = false,
        ["--border"] = false,
        ["--preview-window"] = false,
        ["--no-scrollbar"] = true,
      },
      winopts = {
        width = 120,
        height = 0.9,
        row = 0.5,
        col = 0.5,
        preview = {
          layout = "vertical",
          vertical = "up:70%", -- Adjust preview window height
          scrollchars = { "┃", "" },
        },
        backdrop = 60,
      },
      files = {
        multiprocess = true,
        git_icons = true,
        file_icons = true,
      },
      grep = {
        multiprocess = true,
      },
      defaults = {
        multiprocess = true,
        -- VS Code style
        formatter = { "path.dirname_first", 3 },
      },
      lsp = {
        symbols = {
          symbol_hl = function(s)
            return "TroubleIcon" .. s
          end,
          symbol_fmt = function(s)
            return s:lower() .. "\t"
          end,
          child_prefix = false,
          path_shorten = 1,
        },
        code_actions = {
          winopts = {
            preview = { layout = "reverse-list", horizontal = "right:75%" },
          },
        },
      },
    },
    config = function(_, options)
      local fzf_lua = require("fzf-lua")
      local actions = require("fzf-lua.actions")
      local config = require("fzf-lua.config")

      -- Files actions
      config.defaults.actions.files["alt-."] = actions.toggle_hidden

      -- Trouble
      config.defaults.actions.files["ctrl-t"] = require("trouble.sources.fzf").actions.open

      -- Refer https://github.com/ibhagwan/fzf-lua/blob/main/lua/fzf-lua/defaults.lua#L69 for default keymaps
      -- Shift+up/down to move the preview window
      -- Alt+q to send to quickfix
      -- Alt+a to toggle all
      fzf_lua.setup(options)

      -- Automatic sizing of height/width of vim.ui.select
      fzf_lua.register_ui_select(function(_, items)
        local min_h, max_h = 0.60, 0.80
        local h = (#items + 4) / vim.o.lines
        if h < min_h then
          h = min_h
        elseif h > max_h then
          h = max_h
        end
        return { winopts = { height = h, width = 0.80, row = 0.40 } }
      end)

      -- Refer https://github.com/ibhagwan/fzf-lua/issues/602
      vim.lsp.handlers["textDocument/codeAction"] = fzf_lua.lsp_code_actions
      vim.lsp.handlers["textDocument/definition"] = function()
        fzf_lua.lsp_definitions({ jump_to_single_result = true, ignore_current_line = true })
      end
      vim.lsp.handlers["textDocument/declaration"] = fzf_lua.lsp_declarations
      vim.lsp.handlers["textDocument/typeDefinition"] = fzf_lua.lsp_typedefs
      vim.lsp.handlers["textDocument/implementation"] = fzf_lua.lsp_implementations
      vim.lsp.handlers["textDocument/documentSymbol"] = fzf_lua.lsp_document_symbols
      vim.lsp.handlers["workspace/symbol"] = fzf_lua.lsp_workspace_symbols
      vim.lsp.handlers["callHierarchy/incomingCalls"] = fzf_lua.lsp_incoming_calls
      vim.lsp.handlers["callHierarchy/outgoingCalls"] = fzf_lua.lsp_outgoing_calls
    end,
    keys = {
      { "<esc>", "<cmd>close<cr>", ft = "fzf", mode = "t", nowait = true },
      { "<c-j>", "<Down>", ft = "fzf", mode = "t", nowait = true },
      { "<c-k>", "<Up>", ft = "fzf", mode = "t", nowait = true },
      -- Find file by grep
      {
        "<C-g>",
        "<cmd> :FzfLua grep_project<CR>",
        desc = "Find Grep",
      },
      {
        "<C-g>",
        function()
          -- Grep visual selection in the current directory or lsp root or git root
          local root_dir = require("utils.root").get()
          local fzf_lua = require("fzf-lua")

          fzf_lua.grep_visual({
            cwd = root_dir,
            rg_opts = "--column --hidden --smart-case --color=always --no-heading --line-number -g '!{.git,node_modules}/'",
            multiprocess = true,
          })
        end,
        desc = "Search Grep in visual selection",
        mode = "v",
      },
      {
        "<leader>sw",
        function()
          local root_dir = require("utils.root").git()
          local fzf_lua = require("fzf-lua")

          fzf_lua.grep_visual({
            cwd = root_dir,
            rg_opts = "--column --hidden --smart-case --color=always --no-heading --line-number -g '!{.git,node_modules}/'",
            multiprocess = true,
          })
        end,
        desc = "Search word in visual selection (git root)",
        mode = "v",
      },
      {
        "<leader>fg",
        "<cmd> :FzfLua grep_project --cmd 'git grep --line-number --column --color=always'<CR>",
        desc = "Find Git Grep",
      },
      -- Find open buffers
      {
        "<leader>fb",
        "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
        desc = "Find Buffers",
      },
      {
        "<leader>,",
        "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
        desc = "Switch Buffer",
      },
      -- Find recent files
      {
        "<leader>fr",
        function()
          local root_dir = require("utils.root").git()
          require("fzf-lua").oldfiles({ cwd = root_dir })
        end,
        desc = "Find Recent Files",
      },
      -- Resume last fzf command
      {
        "<leader>fR",
        "<cmd> :FzfLua resume<CR>",
        desc = "Resume Fzf",
      },
      -- File file by live grep, better for large projects
      {
        "<leader>fl",
        function()
          local root_dir = require("utils.root").git()
          local fzf_lua = require("fzf-lua")
          fzf_lua.live_grep({
            cwd = root_dir,
            rg_opts = "--column --hidden --smart-case --color=always --no-heading --line-number -g '!{.git,node_modules}/'",
            multiprocess = true,
          })
        end,
        desc = "Find Live Grep (including hidden files)",
      },
      -- Find files at the current working directory
      {
        "<C-e>", -- <leader>e is used by oil.nvim for open file explorer in float window
        function()
          local root_dir = require("utils.root").get()
          require("fzf-lua").files({
            cwd = root_dir,
            cwd_prompt = false,
          })
        end,
        desc = "Find Files at project directory",
      },
      {
        "<leader><space>",
        function()
          local root_dir = require("utils.root").git()
          require("fzf-lua").files({
            cwd = root_dir,
            cwd_prompt = false,
          })
        end,
        desc = "Find Files at project directory",
      },
      -- File files by live grep in the current directory or LSP root or git root
      {
        "<leader>/",
        function()
          local root_dir = require("utils.root").get()
          require("fzf-lua").live_grep({ cwd = root_dir, multiprocess = true })
        end,
        desc = "Grep Files at current directory",
      },
      -- Find file in git
      {
        "<leader>ff",
        function()
          -- Live grep in the current directory or LSP root or git root
          local root_dir = require("utils.root").git()
          require("fzf-lua").git_files({ cwd = root_dir })
        end,
        desc = "Find Git Files",
      },
      -- Find nvim config file
      {
        "<leader>fc",
        function()
          require("fzf-lua").files({ cwd = "~/.config/nvim" })
        end,
        desc = "Find Neovim Configs",
      },

      -- Search in current buffer with grep
      {
        "<leader>sb",
        "<cmd> :FzfLua grep_curbuf<CR>",
        desc = "Search Current Buffer",
      },
      {
        "<leader>sB",
        "<cmd> :FzfLua lines<CR>",
        desc = "Search Lines in Open Buffers",
      },
      {
        "<leader>sw",
        function()
          local root_dir = require("utils.root").git()
          require("fzf-lua").grep_cword({ cwd = root_dir, multiprocess = true })
        end,
        desc = "Search word under cursor (git root)",
      },
      {
        "<leader>sW",
        function()
          local root_dir = require("utils.root").git()
          require("fzf-lua").grep_cWORD({ cwd = root_dir, multiprocess = true })
        end,
        desc = "Search WORD under cursor (git root)",
      },

      -- Git related keymaps
      -- Search in git status
      {
        "<leader>gs",
        function()
          local root_dir = require("utils.root").git()
          require("fzf-lua").git_status({ cwd = root_dir })
        end,
        desc = "Git Status",
      },
      {
        "<leader>gc",
        "<cmd> :FzfLua git_commits<CR>",
        desc = "Git Commits",
      },
      {
        "<leader>gb",
        "<cmd> :FzfLua git_branches<CR>",
        desc = "Git Branches",
      },
      {
        "<leader>gB",
        "<cmd> :FzfLua git_bcommits<CR>",
        desc = "Git Buffer Commits",
      },

      -- Search keymaps
      {
        "<leader>sa",
        "<cmd> :FzfLua commands<CR>",
        desc = "Find Actions",
      },
      {
        "<leader>sd",
        "<cmd>FzfLua diagnostics_document<cr>",
        desc = "Document Diagnostics",
      },
      {
        "<leader>sD",
        "<cmd>FzfLua diagnostics_workspace<cr>",
        desc = "Workspace Diagnostics",
      },
      {
        "<leader>s:",
        "<cmd> :FzfLua command_history<CR>",
        desc = "Find Command History",
      },
      {
        "<leader>ss",
        function()
          require("fzf-lua").lsp_document_symbols({
            regex_filter = symbols_filter,
          })
        end,
        desc = "Goto Symbol",
      },
      {
        "<leader>sS",
        function()
          require("fzf-lua").lsp_live_workspace_symbols({
            regex_filter = symbols_filter,
          })
        end,
        desc = "Goto Symbol (Workspace)",
      },
      {
        "<leader>si",
        "<cmd> :FzfLua lsp_incoming_calls<CR>",
        desc = "LSP Incoming Calls",
      },
      {
        "<leader>so",
        "<cmd> :FzfLua lsp_outgoing_calls<CR>",
        desc = "LSP Outgoing Calls",
      },
      {
        "<leader>sk",
        "<cmd> :FzfLua keymaps<CR>",
        desc = "Search Keymaps",
      },
      {
        "<leader>sm",
        "<cmd> :FzfLua marks<CR>",
        desc = "Search Marks",
      },
      {
        "<leader>sc",
        "<cmd> :FzfLua colorschemes<CR>",
        desc = "Search colorschemes",
      },
      {
        "<leader>sh",
        "<cmd> :FzfLua help_tags<CR>",
        desc = "Search Help",
      },
      {
        "<leader>sj",
        "<cmd>FzfLua jumps<cr>",
        desc = "Search Jumplist",
      },
      {
        "<leader>sq",
        "<cmd> :FzfLua quickfix<CR>",
        desc = "Search Quickfix",
      },

      -- Switch project
      -- Find in recent projects
      {
        "<leader>fp",
        function()
          local fzf_lua = require("fzf-lua")

          local ok, _ = pcall(require, "project_nvim")
          if not ok then
            vim.notify("Project.nvim is not installed", vim.log.levels.ERROR, { title = "Fzf Lua" })
            return
          end

          local history = require("project_nvim.utils.history")
          local results = history.get_recent_projects()
          fzf_lua.fzf_exec(results, {
            actions = {
              ["default"] = {
                function(selected)
                  fzf_lua.files({ cwd = selected[1] })
                end,
              },
            },
          })
        end,
        desc = "Search Recent Projects",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      {
        "<leader>st",
        function()
          require("todo-comments.fzf").todo()
        end,
        desc = "Todo",
      },
      {
        "<leader>sT",
        function()
          require("todo-comments.fzf").todo({ keywords = { "TODO", "FIX", "FIXME" } })
        end,
        desc = "Todo/Fix/Fixme",
      },
    },
  },
}
