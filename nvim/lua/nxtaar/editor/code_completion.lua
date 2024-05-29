local function higlight_snippet_match(entry, vim_item)
    local types = require('cmp.types')
    local str = require('cmp.utils.str')
    -- Get the full snippet (and only keep first line)
    local word = entry:get_insert_text()
    if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
        word = vim.lsp.util.parse_snippet(word)
    end
    word = str.oneline(word)

    -- concatenates the string
    -- local max = 50
    -- if string.len(word) >= max then
    -- 	local before = string.sub(word, 1, math.floor((max - 3) / 2))
    -- 	word = before .. "..."
    -- end

    if
        entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
        and string.sub(vim_item.abbr, -1, -1) == '~'
    then
        word = word .. '~'
    end
    vim_item.abbr = word

    return vim_item
end

local function cmp_config()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')
    local friendly_snippets = require('luasnip/loaders/from_vscode')

    friendly_snippets.lazy_load()

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },
        sources = {
            { name = 'path' },
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'luasnip', keyword_length = 2 },
            { name = 'buffer',  keyword_length = 3 }
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol_text',
                maxwidth = 50,
                ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                -- The function below will be called before any actual modifications from lspkind
                -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                before = higlight_snippet_match
            })
        },
        mapping = cmp.mapping.preset.insert({
            [get_keymap_config_for_action('completion.scroll-down').key] = cmp.mapping.scroll_docs(-4),
            [get_keymap_config_for_action('completion.scroll-up').key] = cmp.mapping.scroll_docs(4),
            [get_keymap_config_for_action('completion.complete').key] = cmp.mapping.complete(),
            [get_keymap_config_for_action('completion.confirm').key] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            [get_keymap_config_for_action('completion.smart-select-next').key] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            [get_keymap_config_for_action('completion.smart-select-prev').key] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),
        window = {
            documentation = {
                max_width = 100,
            }
        },
    })
end
local M = {
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = 'make install_jsregexp',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets'
        },
    },
    {
        'hrsh7th/nvim-cmp',
        config = cmp_config,
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'onsails/lspkind.nvim' }
        }
    }
}



return M
