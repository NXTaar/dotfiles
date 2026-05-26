local heirline_utils = require('heirline.utils')

local function render(factory, ctx)
    return type(factory) == 'function' and factory(ctx) or factory or ''
end

local function resolve_hl(hl_factory, ctx)
    local hl = render(hl_factory, ctx)
    return type(hl) == 'string' and heirline_utils.get_highlight(hl) or hl
end

return function(props)
    return {
        init = function(self)
            self.content = render(props.content, self)
            self.pill_icon = render(props.icon, self)
            self.pill_icon_color = render(props.icon_color, self)
            self.pill_color = render(props.pill_color, self)
            self.content_hl = resolve_hl(props.content_hl, self)
        end,
        {
            provider = '',
            hl = function(self)
                return {
                    fg = self.pill_color
                }
            end
        },
        {
            provider = function(self)
                return self.pill_icon
            end,
            hl = function(self)
                return {
                    fg = self.pill_icon_color,
                    bg = self.pill_color
                }
            end
        },
        props.single_pill and {
            provider = ' ',
            hl = function(self)
                return {
                    bg = self.content_hl.bg
                }
            end
        } or {
            provider = ' ',
            hl = function(self)
                return {
                    fg = self.pill_color,
                    bg = self.content_hl.bg
                }
            end
        },
        {
            provider = function(self)
                return self.content
            end,
            hl = function(self)
                return self.content_hl
            end
        },
        {
            provider = ' ',
            hl = function(self)
                return {
                    fg = self.content_hl.bg
                }
            end
        }
    }
end
