return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ui = {
      icons = {
        package_installed = "✓",
        package_pending = "",
        package_uninstalled = "✗",
      },
    }
    vim.list_extend(
      opts.ensure_installed,
      {
        "dockerfile-language-server",
        -- formatters
        "stylua",
        "eslint_d",
        "prettier",
        "prettierd",
        -- code spell
        "codespell",
        "misspell",
        "cspell",
        "tailwindcss-language-server",

        -- PHP
        "intelephense",
        "php-cs-fixer",
        "phpactor",
        "phpcbf",
        "phpcs",
        "phpstan",
        "pint",
        -- lua
        "lua-language-server",
        "luacheck",
        "luaformatter",
        -- markdown
        "markdownlint",
        -- rustywind for tailwindcss
        "rustywind",
        -- Solidity
        "solidity",
        -- Python
        -- "ruff",
        "isort",
        "marksman",
        "lua-language-server",
      }
    )
  end,
};
