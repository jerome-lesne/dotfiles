local opt = vim.opt

opt.clipboard = "unnamedplus"                           -- allows nvim to acces sys clipboard
opt.completeopt = { "menuone", "noselect", "noinsert" } -- completion options
opt.fileencoding = "utf-8"                              -- file encoding
opt.showtabline = 2                                     -- always show tab line
opt.smartindent = true                                  -- smart indentation
opt.splitright = true                                   -- splitbelow
opt.splitbelow = true                                   -- splitright
opt.swapfile = false                                    -- don't create swapfile
opt.number = true                                       -- show line number
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
