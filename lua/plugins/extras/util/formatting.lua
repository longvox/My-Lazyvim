local function biome_config_exists()
  local current_dir = vim.fn.getcwd()
  local config_file = current_dir .. "/biome.json"
  if vim.fn.filereadable(config_file) == 1 then
    return true
  end

  return false
end

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
        -- common
        b.code_actions.refactoring,

        -- spell check
        b.completion.spell,

        -- tailwind
        b.formatting.rustywind.with({
          filetypes = { "html", "css", "javascriptreact", "typescriptreact", "svelte" },
        }),

        -- zsh
        b.diagnostics.zsh,
        b.formatting.shfmt,

        -- js/ts
        b.formatting.prettierd,
        b.formatting.prettier,
        b.formatting.biome.with({
          condition = function()
            return biome_config_exists()
          end,
        }),

        -- Lua
        b.formatting.stylua,

        -- golang
        b.code_actions.gomodifytags,
        b.code_actions.impl,
        b.formatting.gofumpt,
        b.formatting.golines,

        -- Markdown
        b.formatting.markdownlint.with({
          extra_args = { "--config", vim.fn.getcwd() .. "/.markdownlint.json" },
        }),
        b.diagnostics.markdownlint.with({
          extra_args = { "--config", vim.fn.getcwd() .. "/.markdownlint.json" },
        }),

        -- Php
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

        -- env
        b.diagnostics.dotenv_linter,
        b.hover.printenv,

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
