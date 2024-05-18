return {
  -- Add Tailwind CSS LSP
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "astro-language-server",
        "tailwindcss-language-server",
        "rustywind",
        "vue-language-server",
        "vetur-vls",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "svelte", "vue" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        svelte = {},
        tailwindcss = {
          filetypes_exclude = { "markdown" },
        },
        volar = {
          filetypes = {
            -- "typescript",
            "vue",
          },
        },
      },
      setup = {
        tailwindcss = function(_, opts)
          local tw = require("lspconfig.server_configurations.tailwindcss")
          --- @param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, tw.default_config.filetypes)
        end,
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
