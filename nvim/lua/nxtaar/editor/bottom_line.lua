return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            extensions = { 'oil', 'lazy', 'mason' },
            sections = {
                lualine_c = { 'harpoon2' },
            },
        }
    }
}
