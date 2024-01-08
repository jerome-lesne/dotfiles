local config = function()
    require('bufferline').setup{
        options = {
            buffer_close_icon = '',
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    separator = true -- use a "true" to enable the default, or set your own character
                },
            color_icons = true, -- whether or not to add the filetype icon highlights
            }
        }
    }
end

return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = config,
    event = 'BufReadPre'
}
