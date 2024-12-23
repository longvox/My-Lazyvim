local logo = [[
 ██▓ ███▄ ▄███▓    ██▓     ▒█████   ███▄    █   ▄████ 
▓██▒▓██▒▀█▀ ██▒   ▓██▒    ▒██▒  ██▒ ██ ▀█   █  ██▒ ▀█▒
▒██▒▓██    ▓██░   ▒██░    ▒██░  ██▒▓██  ▀█ ██▒▒██░▄▄▄░
░██░▒██    ▒██    ▒██░    ▒██   ██░▓██▒  ▐▌██▒░▓█  ██▓
░██░▒██▒   ░██▒   ░██████▒░ ████▓▒░▒██░   ▓██░░▒▓███▀▒
░▓  ░ ▒░   ░  ░   ░ ▒░▓  ░░ ▒░▒░▒░ ░ ▒░   ▒ ▒  ░▒   ▒ 
 ▒ ░░  ░      ░   ░ ░ ▒  ░  ░ ▒ ▒░ ░ ░░   ░ ▒░  ░   ░ 
 ▒ ░░      ░        ░ ░   ░ ░ ░ ▒     ░   ░ ░ ░ ░   ░ 
 ░         ░          ░  ░    ░ ░           ░       ░ 
]]
logo = string.rep("\n", 4) .. logo .. "\n\n"

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = logo,
          keys = {
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = "󰊳 ", desc = "Update", group = "@property", action = ":Lazy update", key = "u" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy },
            {
              icon = "󰀳 ",
              key = "x",
              desc = "LazyExtras",
              action = ":LazyExtras",
              enabled = package.loaded.lazyExtras,
            },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2, limit = 5 },
          { section = "keys" },
          { section = "startup" },
        },
      },
      bigfile = { enabled = true },
      notifier = {
        enabled = false,
      },
      quickfile = { enabled = true },
      statuscolumn = {
        enabled = true,
      },
      words = { enabled = true },
      styles = {
        notification = {
          wo = { wrap = true }, -- Wrap notifications
        },
        -- LazyGit full screen
        lazygit = {
          width = 0.9,
          height = 0.9,
        },
      },
    },
  },
}
