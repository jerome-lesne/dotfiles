local config = function()
    require("conform").setup({
        notify_on_error = false,
        format_on_save = function(bufnr)
            -- Disable "format_on_save lsp_fallback" for languages that don't
            -- have a well standardized coding style. You can add additional
            -- languages here or re-enable it for the disabled ones.
            local disable_filetypes = { c = true, cpp = true }
            local lsp_format_opt
            if disable_filetypes[vim.bo[bufnr].filetype] then
                lsp_format_opt = 'never'
            else
                lsp_format_opt = 'fallback'
            end
            return {
                timeout_ms = 500,
                lsp_format = lsp_format_opt,
            }
        end,
        formatters_by_ft = {
            -- Conform can also run multiple formatters sequentially
            -- python = { "isort", "black" },
            -- 'stop_after_first' to run the first available formatter from the list
            twig = { "twig-cs-fixer" },
            javascript = { "prettierd" },
            html = { "prettierd" },
            javascriptreact = { "prettierd" },
            markdown = { "prettierd" }
        },
        formatters = {
            -- Add arguments to set parser and tab width for twig files
            prettierd = {
                prepend_args = function(_, _, filetype)
                    if filetype == "twig" then
                        return { "--parser", "html", "--tab-width", "4" }
                    else
                        return { "--tab-width", "4" }
                    end
                end
            },
        }
    })
end

return { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<leader>fo',
            function()
                require('conform').format { async = true, lsp_format = 'fallback' }
            end,
            mode = '',
            desc = '[Fo]rmat buffer',
        },
    },
    config = config
}
