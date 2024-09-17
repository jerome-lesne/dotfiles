vim.cmd("let $LANG='en_US.UTF-8'") -- change language to english

local opt = vim.opt
local keymap = vim.api.nvim_set_keymap

opt.clipboard = "unnamedplus"                           -- allows nvim to acces sys clipboard
opt.completeopt = { "menuone", "noselect", "noinsert" } -- completion options
opt.fileencoding = "utf-8"                              -- file encoding
opt.showtabline = 2                                     -- always show tab line
opt.smartindent = true                                  -- smart indentation
opt.splitright = true                                   -- splitbelow
opt.splitbelow = true                                   -- splitright
opt.swapfile = false                                    -- don't create swapfile
opt.number = true                                       -- show line number
opt.relativenumber = true                               -- show relative line nbr
opt.expandtab = true                                    -- convert tabs into spaces
opt.shiftwidth = 4                                      -- number of spaces for each indentation
opt.tabstop = 4                                         -- number of spaces for each tab
opt.softtabstop = 4                                     -- number of space with tab on insert mode
opt.cursorline = true                                   -- cursorline
opt.signcolumn = "yes"                                  -- always display sign column
opt.wrap = false                                        -- no wrap lines
opt.scrolloff = 8                                       -- minimum number of lines above & below cursorline
opt.sidescrolloff = 8                                   -- same as scrolloff but horizontal
opt.updatetime = 50                                     -- faster completion (default 4000)
opt.termguicolors = true                                -- term gui true color
opt.hlsearch = false                                    -- dont keep search highlighted
opt.incsearch = true                                    -- incremental search
opt.ignorecase = true                                   -- ignore case while searching
opt.smartcase = true                                    -- smart search regarding case
opt.clipboard:append('unnamedplus')                     -- allow copy/paste inside/outside vim
opt.hlsearch = true                                     -- hilight search pemanently (see remap :noh on esc to exit it)
opt.showtabline = 0                                     -- remove tabline
opt.showmode = false                                    -- show mode
opt.pumblend = 0                                        -- transparent floating windows
opt.virtualedit = "block"                               -- allow expand selection to a non character area

-- Netrw Config

vim.g.netrw_banner = 0    -- disable netwr banner
vim.g.netrw_winsize = 25  -- winsize of netwr
vim.g.netrw_liststyle = 3 -- tree style

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
    hi! TelescopePromptBorder ctermbg=NONE guibg=NONE
    hi! TelescopePromptTitle ctermbg=NONE guibg=NONE
    hi! Pmenu ctermbg=NONE guibg=NONE
    hi! FloatBorder ctermbg=NONE guibg=NONE
    hi! Search guibg='NONE' guifg='NONE'
]]

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
})
