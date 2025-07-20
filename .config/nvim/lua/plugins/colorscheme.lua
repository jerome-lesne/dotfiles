local config = function()
    vim.cmd('colorscheme tokyonight')
    vim.cmd [[
        hi! Normal guibg=NONE ctermbg=NONE
        hi! NonText ctermbg=NONE guibg=NONE
        hi! LineNr ctermbg=NONE guibg=NONE
        hi! SignColumn ctermbg=NONE guibg=NONE
        hi! VertSplit ctermbg=NONE guibg=NONE
        hi! EndOfBuffer ctermbg=NONE guibg=NONE
        hi! CursorColumn ctermbg=NONE guibg=NONE
        hi! NvimTreeNormal ctermbg=NONE guibg=NONE
        hi! NvimTreeNormalNC ctermbg=NONE guibg=NONE
        hi! NvimTreeVertSplit ctermbg=NONE guibg=NONE
        hi! NvimTreeEndOfBuffer ctermbg=NONE guibg=NONE
        hi! NvimTreeCursorColumn ctermbg=NONE guibg=NONE
        hi! NormalFloat guibg=NONE ctermbg=NONE
        hi! NvimTreeWinSeparator guibg=NONE guifg=NONE
        hi! NormalNC ctermbg=NONE guibg=NONE
        hi! TelescopeNormal ctermbg=NONE guibg=NONE
        hi! TelescopeBorder ctermbg=NONE guibg=NONE
        hi! TelescopePromptBorder ctermbg=NONE guibg=NONE
        hi! TelescopePromptTitle ctermbg=NONE guibg=NONE
        hi! Pmenu ctermbg=NONE guibg=NONE
        hi! FloatBorder ctermbg=NONE guibg=NONE
        hi! Search guibg='NONE' guifg='NONE'
        ]]
end

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = config,
}
