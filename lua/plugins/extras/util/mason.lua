return {
  -- cmdline tools and lsp servers global
  {
    "williamboman/mason.nvim", 
    opts = function(_, opts)
      opts.ui = {
        icons = {
          package_installed = "✓",
          package_pending = "",
          package_uninstalled = "✗",
        },
      }
      opts.ensure_installed = {
        -- formatters
        "stylua",
        "eslint_d",
        "prettier",
        "prettierd",
        -- code spell
        "codespell",
        "misspell",
        "cspell",
        -- markdown
        -- "markdownlint",
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
    end,
  },
}
