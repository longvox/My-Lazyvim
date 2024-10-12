local h = require("null-ls.helpers")
-- formatters
return {
  { import = "lazyvim.plugins.extras.lsp.none-ls" },
  {
    "nvimtools/none-ls.nvim",
    keys = {
      { "<leader>ci", "<cmd>NullLsInfo<cr>", desc = "NullLs Info" },
    },
    dependencies = {
      "mason.nvim",
    },
    debug = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local none_ls = require("null-ls")
      local b = none_ls.builtins
      local sources = {

        -- spell check
        b.completion.spell,

        -- tailwind
        b.formatting.rustywind.with({
          filetypes = { "html", "css", "javascriptreact", "typescriptreact", "svelte" },
        }),

        -- zsh
        b.diagnostics.zsh,
        b.formatting.shfmt,

        -- prettier
        b.formatting.prettierd,
        b.formatting.prettier,

        -- Lua
        b.formatting.stylua,

        -- golang
        b.formatting.gofumpt,
        b.formatting.golines,

        -- Php - comment out as I don't use php much
        -- PHP CodeSniffer for diagnostics
        -- b.diagnostics.phpcs.with({
        --   generator_opts = {
        --     command = "phpcs",
        --     args = {
        --       "--report=json",
        --       -- silence status messages during processing as they are invalid JSON
        --       "-q",
        --       -- always report codes
        --       "-s",
        --       -- phpcs exits with a non-0 exit code when messages are reported but we only want to know if the command fails
        --       "--runtime-set",
        --       "ignore_warnings_on_exit",
        --       "1",
        --       "--runtime-set",
        --       "ignore_errors_on_exit",
        --       "1",
        --       -- process stdin
        --       "--stdin-path=$FILENAME",
        --       "--standard=/home/longvh/.phpcs.xml",
        --       "-",
        --     },
        --     format = "json_raw",
        --     to_stdin = true,
        --     from_stderr = false,
        --     check_exit_code = function(code)
        --       return code <= 1
        --     end,
        --     on_output = function(params)
        --       local parser = h.diagnostics.from_json({
        --         attributes = {
        --           severity = "type",
        --           code = "source",
        --         },
        --         severities = {
        --           ERROR = h.diagnostics.severities["error"],
        --           WARNING = h.diagnostics.severities["warning"],
        --         },
        --       })
        --       params.messages = params.output
        --           and params.output.files
        --           and params.output.files[params.bufname]
        --           and params.output.files[params.bufname].messages
        --         or {}
        --
        --       return parser({ output = params.messages })
        --     end,
        --   },
        -- }),

        -- b.diagnostics.phpstan.with({
        --   command = "phpstan",
        --   args = { "analyze", "--error-format", "json", "--no-progress", "$FILENAME" },
        -- }),

        -- PHP Code Beautifier and Fixer
        -- b.formatting.phpcbf.with({
        --   generator_opts = {
        --     command = "phpcbf",
        --     args = {
        --       "-q",
        --       "--stdin-path=$FILENAME",
        --       "--standard=PSR12",
        --       "-",
        --     },
        --     to_stdin = true,
        --     check_exit_code = function(code)
        --       -- phpcbf return a 1 or 2 exit code if it detects warnings or errors
        --       return code <= 2
        --     end,
        --   },
        --   -- filetypes = { 'php' },
        --   -- command = 'phpcbf',
        --   -- extra_args = { '--standard=CakePHP', '--colors', '-p'},
        -- }),

        -- PHP-CS-Fixer configuration
        b.formatting.phpcsfixer.with({
          timeout = 10000,
          extra_args = function(params)
            if params.options then
              return {
                "--allow-risky",
                "yes",
                "--config",
                ".php-cs-fixer.php",
              }
            end
          end,
        }),

        b.formatting.pint.with({
          condition = function(utils)
            local has_pint_installed_locally = utils.root_has_file({
              "./vendor/bin/pint",
            })
            return has_pint_installed_locally
          end,
        }),
        -- other stuff
        b.diagnostics.todo_comments,
        -- b.diagnostics.trail_space,
        b.code_actions.refactoring,
      }

      return {
        sources = sources,
        debounce = 200,
        debug = true,
      }
    end,
  },
}
