local libs = {
    'b0o/schemastore.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'rafamadriz/friendly-snippets',
    'anuvyklack/middleclass',
    'anuvyklack/animation.nvim',
}

return vim.tbl_map(function(item)
    return {
        item,
        lazy = true,
    }
end, libs)
