vim.lsp.enable({
    "html",
    "lua_ls",
    "vtsls",
    "angularls"
})

vim.diagnostic.config({
    virtual_lines = {
        severity = {
          min = vim.diagnostic.severity.WARN,
        },
    },
    virtual_text = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true
    }
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
