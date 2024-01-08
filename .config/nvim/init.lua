require('config')

-- Make everything transparent
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
    hi! NormalNC ctermbg=NONE guibg=NONE
    hi! TelescopeNormal ctermbg=NONE guibg=NONE
    hi! TelescopeBorder ctermbg=NONE guibg=NONE
    highlight Search guibg='Purple' guifg='NONE'
]]