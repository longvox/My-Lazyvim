return {
  -- Add PHP to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "php" })
      end
    end,
  },

  -- Correctly setup lspconfig for PHP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        intelephense = {
          root_dir = require("lspconfig").util.root_pattern("composer.json", ".git", "*.php"),
        },
      },
    },
  },

  -- {
  --   "nvimtools/none-ls.nvim",
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     local composer_global_dir = vim.fn.expand("$HOME/.config/composer")
  --     local composer_global_bin_dir = composer_global_dir .. "/vendor/bin"
  --
  --     vim.list_extend(opts.sources,
  --       {
  --         nls.builtins.formatting.phpcsfixer.with({
  --           temp_dir = "/tmp",
  --           command = composer_global_bin_dir .. "/php-cs-fixer",
  --           extra_args = {
  --             "--config",
  --             composer_global_dir .. "/.php_cs_fixer.php",
  --           },
  --         }),
  --         nls.builtins.diagnostics.phpstan.with({
  --           temp_dir = "/tmp",
  --           command = composer_global_bin_dir .. "/phpstan",
  --           extra_args = { "-l", "max" },
  --         }),
  --       }
  --     )
  --   end,
  -- },
  { "olimorris/neotest-phpunit" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-phpunit" } },
  },
}
