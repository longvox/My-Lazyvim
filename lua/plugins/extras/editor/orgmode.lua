return {
  "nvim-orgmode/orgmode",
  config = function()
    require("orgmode").setup_ts_grammar()
    require("orgmode").setup({
      org_agenda_files = "~/orgmode/*",
      org_default_notes_file = "~/orgmode/refile.org",
    })
  end,
}
