local config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
        "default-title",
        keymap = {
            fzf = {
                true,
                ["j"] = "down",
                ["k"] = "up",
                ["i"] = "unbind(j)+unbind(k)+unbind(i)+change-prompt([🟢 INSERT]: )",
                ["esc"] = 'transform:case "$FZF_PROMPT" in\n'
                    .. '*NORMAL*) echo abort;;\n'
                    .. '*) echo "change-prompt([🔵 NORMAL]: )'
                    .. '+rebind(j)+rebind(k)+rebind(i)";;'
                    .. '\nesac',
                ["start"] = "unbind(j)+unbind(k)+unbind(i)+change-prompt([🟢 INSERT]: )"
            }
        },
        hls = {
            normal = "NormalFloat",
            border = "FloatBorder",
            title = "NormalFloat",
            preview_normal = "NormalFloat",
            preview_border = "FloatBorder",
            preview_title = "NormalFloat"
        }
    })
    -- Override vim.ui with fzf-lua
    vim.ui.select = fzf.ui_select
    vim.ui.input = fzf.ui_input -- optional
end

return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    keys = {
        {"<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find Files" },
        {"<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" }
    },
    config = config,
}
