-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "dap-float",
        "httpResult",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("wrap_spell"),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.spell = false
    end,
})

-- Set filetype for .env and .env.* files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.env", ".env.*" },
    callback = function()
        vim.opt_local.filetype = "env"
    end,
})

-- Set filetype for .hurl files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.hurl" },
    callback = function()
        vim.opt_local.filetype = "hurl"
    end,
})

-- vim.cmd([[
--     " Disable LSP BufWritePre autocmd
--     autocmd! lsp_c_1_b_45_save BufWritePre
--
--     " Disable EditorConfig BufWritePre autocmd
--     autocmd! editorconfig BufWritePre
-- ]])
