local config = function()
    require("gitsigns").setup()
end

return { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    config = config
}
