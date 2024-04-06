-- formatters
return {
  { import = "lazyvim.plugins.extras.lsp.none-ls" },
  {
    "nvimtools/none-ls.nvim",
    keys = {
      { "<leader>cn", "<cmd>NullLsInfo<cr>", desc = "NullLs Info" },
    },
    dependencies = {
      "mason.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local none_ls = require("null-ls")
      local b = none_ls.builtins
      -- code action sources
      -- local code_actions = null_ls.builtins.code_actions
      --
      -- -- diagnostic sources
      -- local diagnostics = null_ls.builtins.diagnostics
      --
      -- -- formatting sources
      -- local formatting = null_ls.builtins.formatting
      --
      -- -- hover sources
      -- local hover = null_ls.builtins.hover
      --
      -- -- completion sources
      -- local completion = null_ls.builtins.completion
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

        -- Markdown
        b.diagnostics.write_good,
        b.diagnostics.markdownlint,
        b.formatting.markdownlint,

        -- Php - comment out as I don't use php much
        b.diagnostics.phpcs.with({
          extra_args = { "--standard=PSR12" },
        }),

        -- b.formatting.phpcbf.with({
        -- 	prefer_local = "./vendor/bin",
        -- 	condition = function(utils)
        -- 		local has_phpcbf_installed_locally = utils.root_has_file({
        -- 			"./vendor/bin/phpcbf",
        -- 		})
        -- 		return has_phpcbf_installed_locally
        -- 	end,
        -- }),

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
        b.diagnostics.trail_space,
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
