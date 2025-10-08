vim.lsp.enable({
    "html",
    "lua_ls",
    "vtsls",
    "angular_ls"
})

vim.diagnostic.config({
    virtual_lines = true,
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true
    }
})
