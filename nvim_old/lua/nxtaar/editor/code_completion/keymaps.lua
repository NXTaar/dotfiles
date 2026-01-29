local cmp = require('cmp')
local luasnip = require('luasnip')

local keymaps = {
    ['completion.scroll-down'] = cmp.mapping.scroll_docs(-4),
    ['completion.scroll-up'] = cmp.mapping.scroll_docs(4),
    ['completion.complete'] = cmp.mapping.complete(),
    ['completion.confirm'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
    }),
    ['completion.smart-select-next'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        else
            fallback()
        end
    end, { 'i', 's' }),
    ['completion.smart-select-prev'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { 'i', 's' }),
}

local M = {}

for action, handler in pairs(keymaps) do
    M[get_keymap_config_for_action(action).key] = handler
end

return M
