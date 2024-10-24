local config = function()
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    require('nvim-treesitter.configs').setup({
        ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = {
            enable = true,
            -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
            -- If you are experiencing weird indenting issues, add the language to
            -- the list of additional_vim_regex_highlighting and disabled languages for indent.
            additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },
        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
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
    -- Use another parser for certain filetype for example html parser for twig files:
    -- vim.treesitter.language.register("html", "twig")
end

return { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = config
}
