return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = {
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
    }
}
