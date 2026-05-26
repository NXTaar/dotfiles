return {
    'stevearc/oil.nvim',
    event = "VeryLazy",
    opts = {
        columns = {'icon'},
        view_options = {
            show_hidden = true
        }
    },
    keys = {{
        "<leader>-",
        "<cmd>Oil<cr>",
        desc = "Open file tree"
    }}
}
