-- Harpoon transparency
vim.api.nvim_create_autocmd("FileType", {
    pattern = "harpoon",
    callback = function()
        vim.cmd("setlocal winhighlight=Normal:Normal")
    end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- LSP Attach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    local fzf = require('fzf-lua')

    map('gd', fzf.lsp_definitions, '[G]oto [D]efinition')
    map('gr', fzf.lsp_references, '[G]oto [R]eferences')
    map('gI', fzf.lsp_implementations, '[G]oto [I]mplementation')
    map('<leader>D', fzf.lsp_typedefs, 'Type [D]efinition')
    map('<leader>ds', fzf.lsp_document_symbols, '[D]ocument [S]ymbols')
    map('<leader>ws', fzf.lsp_workspace_symbols, '[W]orkspace [S]ymbols')
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ca', fzf.lsp_code_actions, '[C]ode [A]ction', { 'n', 'x' })
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    map('K', vim.lsp.buf.hover, 'Hover Info')
  end,
})
