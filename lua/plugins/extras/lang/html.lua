return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "html", "css" })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "prettierd" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        -- html
        html = {
          filetypes = {
            "html",
            "blade",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
        },
        -- Emmet
        emmet_ls = {
          init_options = {
            html = {
              options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
              },
            },
          },
        },
        -- CSS
        -- cssls = {},
      },
    },
  },
  -- auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = true,
  },

  -- auto html tag completion
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {
      filetypes = {
        "html",
        "vue",
        "blade",
      },
    },
  },

  {
    "uga-rosa/ccc.nvim",
    opts = {},
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
    keys = {
      { "<leader>cz", desc = "Color" },
      { "<leader>czp", "<cmd>CccPick<cr>", desc = "Pick" },
      { "<leader>czc", "<cmd>CccConvert<cr>", desc = "Convert" },
      { "<leader>czh", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle Highlighter" },
    },
  },
}
