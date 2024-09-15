vim.cmd("let $LANG='en_US.UTF-8'")                      -- change language to english

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
opt.showmode = true                                     -- show mode
opt.pumblend = 0                                        -- transparent floating windows

-- Netrw Config

vim.g.netrw_banner = 0                                  -- disable netwr banner
vim.g.netrw_winsize = 25                                -- winsize of netwr
vim.g.netrw_liststyle = 3                               -- tree style

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

-- STATUS-LINE

-- Table that maps file types to Nerd Font icons
local filetype_icons = {
    python = '',     -- Python
    javascript = '', -- JavaScript
    typescript = '', -- TypeScript
    html = '',       -- HTML
    css = '',        -- CSS
    scss = '',       -- SCSS
    lua = '',        -- Lua
    c = '',          -- C
    cpp = '',        -- C++
    java = '',       -- Java
    ruby = '',       -- Ruby
    php = '',        -- PHP
    go = '',         -- Go
    rust = '',       -- Rust
    shell = '',      -- Shell script
    vim = '',        -- Vim
    markdown = '',   -- Markdown
    json = '',       -- JSON
    yaml = '',       -- YAML
    xml = '󰗀',        -- XML
    dockerfile = '', -- Dockerfile
    gitcommit = '',  -- Git commit
    gitconfig = '',  -- Git config
    gitignore = '',  -- Git ignore
    sql = '',        -- SQL
    perl = '',       -- Perl
    r = '󰟔',          -- R
    haskell = '',    -- Haskell
    kotlin = '',     -- Kotlin
    scala = '',      -- Scala
    swift = '',      -- Swift
    dart = '',       -- Dart
    elm = '',        -- Elm
    erlang = '',     -- Erlang
    elixir = '',     -- Elixir
    clojure = '',    -- Clojure
    graphql = '',    -- GraphQL
    vue = '',        -- Vue
    svelte = '',     -- Svelte
    nginx = '',      -- Nginx
    bash = '',       -- Bash
    zsh = '',        -- Zsh
    powershell = '', -- PowerShell
    tex = 'ﭨ',        -- TeX
    vuejs = '󰡄',      -- Vue.js
    angular = '',    -- Angular
    react = '󰜈',      -- React
    default = '',    -- Default (any other file type)
}

-- Function to get the icon based on the file type
function GetFileTypeIcon()
    local filetype = vim.bo.filetype
    return filetype_icons[filetype] or filetype_icons['default']
end

-- Function to get the percentage through the document with fixed width
function FormatPercentage()
    local percentage = string.format("%3d%%", vim.fn.line('.') / vim.fn.line('$') * 100)
    return percentage
end

-- Function to get the line/column information with fixed width
function FormatLineCol()
    return string.format("%4d :%3d", vim.fn.line('.'), vim.fn.col('.'))
end

-- Set the status line with fixed-width formatting
vim.o.statusline = 
    " %{expand('%:.')} " ..
    "%=┃ " ..
    "%{v:lua.GetFileTypeIcon()} %y " ..
    "┃" ..
    " %{v:lua.FormatPercentage()} " ..
    "┃" ..
    "%{v:lua.FormatLineCol()}"

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})
