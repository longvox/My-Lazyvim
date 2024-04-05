return {
  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = vim.fn.has("nvim-0.10") },
      servers = {
        autoformat = false,
        -- sourcekit will be automatically installed with mason and loaded with lspconfig
        sourcekit = {},
      },
    },
  },

  -- uncomment and add tools to ensure_installed below
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "lua-language-server",
        "marksman",
        "phpcs",
      })
      opts.ui = {
        icons = {
          package_installed = "✓",
          package_pending = "",
          package_uninstalled = "✗",
        },
      }
    end,
  },

  -- disable the fancy UI for the debugger
  { "rcarriga/nvim-dap-ui", enabled = false },

  -- which key integration
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>dw"] = { name = "+widgets" },
      },
    },
  },
}
