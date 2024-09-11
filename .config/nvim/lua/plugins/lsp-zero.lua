return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "hrsh7th/cmp-nvim-lua" },
            { "onsails/lspkind.nvim" },
            { "saadparwaiz1/cmp_luasnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_cmp()

            require('lspconfig').phpactor.setup {
                init_options = {
                    ["language_server_phpstan.enabled"] = false,
                    ["language_server_psalm.enabled"] = false,
                }
            }

            -- And you can configure cmp even more, if you want to.
            local cmp = require("cmp")
            local cmp_action = lsp_zero.cmp_action()
            require("luasnip.loaders.from_vscode").lazy_load()
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            lsp_zero.set_sign_icons({
                error = "✘",
                warn = "▲",
                hint = "⚑",
                info = "»",
            })

            local lspkind = require('lspkind')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                formatting = {
                    lsp_zero.cmp_format(),
                    fields = { "abbr", "menu", "kind" },
                    -- format = function(entry, item)
                    --     local menu_icon = {
                    --         nvim_lsp = "λ",
                    --         luasnip = "⋗",
                    --         buffer = "Ω",
                    --         path = "",
                    --         nvim_lua = "Π",
                    --     }
                    --
                    --     item.menu = menu_icon[entry.source.name]
                    --     return item
                    -- end,
                    format = lspkind.cmp_format({
                        -- mode = 'symbol', -- show only symbol annotations
                        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        -- can also be a function to dynamically calculate max width such as
                        -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                        ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                        show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                        -- The function below will be called before any actual modifications from lspkind
                        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                        before = function(entry, vim_item)
                            return vim_item
                        end
                    })
                },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    -- ['<Tab>'] = cmp_action.luasnip_jump_forward(),
                    -- ['<S-Tab>'] = cmp_action.luasnip_jump_backward(),
                    ["<Tab>"] = cmp_action.luasnip_supertab(),
                    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
                }),
                sources = {
                    -- { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "luasnip" },
                    { name = "buffer" },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
            })
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require("lspconfig").html.setup({
                filetypes = { "html", "templ", "hbs", "handlebars", "twig" }
            })
            require("lspconfig").htmx.setup({
                filetypes = { "html", "templ", "hbs", "handlebars", "twig" }
            })

            require("mason-lspconfig").setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end,
                },
            })
        end,

    },
    {
        "nvimtools/none-ls.nvim",
        lazy = false,
        config = function()
            local lsp = require("lsp-zero").preset({
                name = "minimal",
                set_lsp_keymaps = true,
                manage_nvim_cmp = true,
                suggest_lsp_servers = false,
            })

            lsp.setup()

            local null_ls = require("null-ls")
            local null_opts = lsp.build_options("null-ls", {})

            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            null_ls.setup({
                on_attach = function(client, bufnr)
                    null_opts.on_attach(client, bufnr)
                    -- Format on save
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                                -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                                vim.lsp.buf.format({ async = false })
                            end,
                        })
                    end
                    ---
                    -- you can add other stuff here....
                    ---
                end,
                sources = {
                    -- Replace these with the tools you have installed
                    null_ls.builtins.formatting.prettierd.with({ extra_args = { "--tab-width=4" } }),
                    null_ls.builtins.formatting.stylua.with({ extra_args = { "--indent_type=Spaces" } }),
                    null_ls.builtins.code_actions.eslint_d,
                    null_ls.builtins.diagnostics.phpcs.with({ extra_args = { "--config-set show_warnings 0" } }),
                    null_ls.builtins.formatting.phpcsfixer,
                },
            })
        end,
    },
}
