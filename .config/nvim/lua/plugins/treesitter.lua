-- local config = function()
-- 	require("nvim-treesitter.configs").setup({
-- 		ensure_installed = {
-- 			"bash",
-- 			"c",
-- 			"diff",
-- 			"html",
-- 			"lua",
-- 			"luadoc",
-- 			"markdown",
-- 			"markdown_inline",
-- 			"query",
-- 			"vim",
-- 			"vimdoc",
-- 			"angular",
-- 		},
-- 		auto_install = true,
-- 		highlight = {
-- 			enable = true,
-- 			additional_vim_regex_highlighting = { "ruby" },
-- 			disable = { "dockerfile" },
-- 		},
-- 		indent = { enable = true, disable = { "ruby" } },
-- 		incremental_selection = {
-- 			enable = true,
-- 			keymaps = {
-- 				init_selection = "<Leader>s", -- set to `false` to disable one of the mappings
-- 				node_incremental = "si",
-- 				scope_incremental = "sc",
-- 				node_decremental = "sd",
-- 			},
-- 		},
-- 	})
-- end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").install({
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"angular",
			"javascript",
			"typescript",
		})
		-- enable treesitter highlighting
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "<filetype>" },
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
