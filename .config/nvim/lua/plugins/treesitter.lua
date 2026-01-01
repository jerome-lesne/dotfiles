local config = function()
    require('nvim-treesitter.configs').setup({
        ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'angular' },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<Leader>s", -- set to `false` to disable one of the mappings
                node_incremental = "si",
                scope_incremental = "sc",
                node_decremental = "sd",
            },
        },
    })
end

return {
    'nvim-treesitter/nvim-treesitter',
    branch = "master",
    build = ':TSUpdate',
    config = config
}
