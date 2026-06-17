local M = {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    main = 'nvim-treesitter',
    opts = {},
    config = function(_, opts)
        local treesitter = require('nvim-treesitter')
        local bundled_parsers = {
            'c',
            'lua',
            'markdown',
            'markdown_inline',
            'query',
            'vim',
            'vimdoc',
        }

        treesitter.setup(opts)

        vim.api.nvim_create_autocmd('FileType', {
            group = vim.api.nvim_create_augroup('nxtaar_treesitter', {
                clear = true,
            }),
            desc = 'Install missing nvim-treesitter parsers and start highlighting',
            callback = function(event)
                local lang = vim.treesitter.language.get_lang(event.match)

                if
                    not lang
                    or not vim.list_contains(treesitter.get_available(), lang)
                then
                    return
                end

                local installed = vim.list_contains(
                    treesitter.get_installed(),
                    lang
                ) or vim.list_contains(bundled_parsers, lang)

                if not installed then
                    local ok, result = pcall(function()
                        return treesitter.install(lang):wait(300000)
                    end)

                    if not ok or result == false then
                        vim.notify(
                            ('Failed to install Treesitter parser for %s'):format(
                                lang
                            ),
                            vim.log.levels.WARN
                        )
                        return
                    end
                end

                pcall(vim.treesitter.start, event.buf, lang)
            end,
        })
    end,
}

return M
