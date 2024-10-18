local config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<leader>&", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>é", function() harpoon:list():select(2) end)
    vim.keymap.set("n", '<leader>"', function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>'", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-k>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-j>", function() harpoon:list():next() end)
end

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = config
}
