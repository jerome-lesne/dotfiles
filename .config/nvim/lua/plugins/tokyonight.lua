return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
	    vim.cmd('colorscheme tokyonight')
    end,

--      require("tokyonight").setup({
--	transparent = true, -- Enable this to disable setting the background color
--   })
}

