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
          { pane = 2, section = "terminal", cmd = "square", height = 5, padding = 0 },
          { pane = 2, section = "terminal", cmd = "square", height = 5, padding = 0 },
          { pane = 2, section = "terminal", cmd = "square", height = 5, padding = 1 },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1, limit = 5 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = vim.fn.isdirectory(".git") == 1,
            cmd = "hub status --short --branch --renames",
            -- height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
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
