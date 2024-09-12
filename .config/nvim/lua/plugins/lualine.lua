local config = function()
    local function char_count()
        local current_buffer = vim.api.nvim_get_current_buf()
        local content = vim.api.nvim_buf_get_lines(current_buffer, 0, -1, false)
        local char_count = 0
        for _, line in ipairs(content) do
            char_count = char_count + #line
        end
        return 'Chars: ' .. char_count
    end

    local function total_lines()
        return 'Lines: ' .. vim.fn.line('$')
    end

    -- local function char_count_without_space()
    --     local current_buffer = vim.api.nvim_get_current_buf()
    --     local content = vim.api.nvim_buf_get_lines(current_buffer, 0, -1, false)
    --     local char_count = 0
    --     for _, line in ipairs(content) do
    --         char_count = char_count + #line:gsub("%s", "")
    --     end
    --     return 'Chars without space: ' .. char_count
    -- end

    require('lualine').setup {
        options = {
            globalstatus = true
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = {
                {
                    'filename',
                    path = 1
                }
            },

            lualine_x = { 'encoding', 'fileformat', 'filetype', char_count, total_lines },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        }
    }
end

return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = config
}
