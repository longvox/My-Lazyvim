return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "javascript", "typescript", "tsx" })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "js-debug-adapter")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "jose-elias-alvarez/typescript.nvim" },
    opts = {
      -- make sure mason installs the server
      servers = {
        ---Typescript
        tsserver = {
          settings = {
            typescript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            javascript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
        -- ESLint
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectory = { mode = "auto" },
          },
        },
      },
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- disable autoformat
        -- eslint = function()
        --   vim.api.nvim_create_autocmd("BufWritePre", {
        --     callback = function(event)
        --       local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
        --       if client then
        --         local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
        --         if #diag > 0 then
        --           vim.cmd("EslintFixAll")
        --         end
        --       end
        --     end,
        --   })
        -- end,
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
      "thenbe/neotest-playwright",
    },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        require("neotest-jest"),
        require("neotest-vitest"),
        require("neotest-playwright").adapter({
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
          },
        }),
      })
    end,
  },
}
