return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "php",
          "twig",
          "blade",
          "phpdoc",
          "php_only",
        })
      end
    end,
    config = function(_, opts)
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      require("nvim-treesitter.configs").setup(opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          init_options = {
            licenceKey = os.getenv("INTELEPHENSE_LICENSE_KEY"),
          },
        },
      },
    },
  },
  {
    "StanAngeloff/php.vim",
    ft = "php",
  },
  {
    "jwalton512/vim-blade",
    config = function()
      -- Define some single Blade directives. This variable is used for highlighting only.
      vim.g.blade_custom_directives = { "datetime", "javascript", "error" }

      -- Define pairs of Blade directives. This variable is used for highlighting and indentation.
      vim.g.blade_custom_directives_pairs = {
        markdown = "endmarkdown",
        cache = "endcache",
        error = "enderror",
      }
    end,
  },
}
