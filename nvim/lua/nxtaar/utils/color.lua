-----------------------------------------------------------------------------
--- Provides support for color manipulation in HSL color space.
---
--- @see http://sputnik.freewisdom.org/lib/colors/
---
--- License: MIT/X
---
--- (c) 2008 Yuri Takhteyev (yuri@freewisdom.org) *
---
--- * rgb_to_hsl() implementation was contributed by Markus Fleck-Graffe.
-----------------------------------------------------------------------------

--- @class Color
--- @field H number Hue value (0-360)
--- @field S number Saturation value (0.0-1.0)
--- @field L number Lightness value (0.0-1.0)
local Color = {}
Color.__index = Color

-----------------------------------------------------------------------------
--- Instantiates a new "color".
---
--- @param H number|string Hue (0-360) or an RGB string ("#930219")
--- @param S number|nil Saturation (0.0-1.0)
--- @param L number|nil Lightness (0.0-1.0)
--- @return Color -- An instance of Color
-----------------------------------------------------------------------------
function Color:new(H, S, L)
    local instance = setmetatable({}, self)

    if type(H) == 'string' and H:sub(1, 1) == '#' and H:len() == 7 then
        H, S, L = Color.rgb_string_to_hsl(H)
    end

    ---@diagnostic disable-next-line: assign-type-mismatch
    instance.H = H
    ---@diagnostic disable-next-line: assign-type-mismatch
    instance.S = S
    ---@diagnostic disable-next-line: assign-type-mismatch
    instance.L = L

    return instance
    -- return setmetatable({ H = H, S = S, L = L }, Color_mt)
end

--- Creates a Color object from a highlight group's color field
--- @param name string The name of the highlight group
--- @param field string The color field to extract (e.g., "fg", "bg")
--- @return Color Color A new Color object with the extracted color value
function Color.from_hl_group(name, field)
    local hl = vim.api.nvim_get_hl(0, {
        name = name,
        link = false,
        create = false,
    })

    return Color:new(string.format('#%06x', hl[field]))
end

-----------------------------------------------------------------------------
--- Converts an HSL triplet to RGB
--- (see http://homepages.cwi.nl/~steven/css/hsl.html).
---
--- @param h number Hue (0-360)
--- @param s number Saturation (0.0-1.0)
--- @param L number Lightness (0.0-1.0)
--- @return number R, number B, number G R, G, and B components of RGB (0.0-1.0)
-----------------------------------------------------------------------------
function Color.hsl_to_rgb(h, s, L)
    h = h / 360
    local m1, m2
    if L <= 0.5 then
        m2 = L * (s + 1)
    else
        m2 = L + s - L * s
    end
    m1 = L * 2 - m2

    --- @param m1_inner number
    --- @param m2_inner number
    --- @param h_inner number
    --- @return number -- RGB component value (0.0-1.0)
    local function inner(m1_inner, m2_inner, h_inner)
        if h_inner < 0 then
            h_inner = h_inner + 1
        end
        if h_inner > 1 then
            h_inner = h_inner - 1
        end
        if h_inner * 6 < 1 then
            return m1_inner + (m2_inner - m1_inner) * h_inner * 6
        elseif h_inner * 2 < 1 then
            return m2_inner
        elseif h_inner * 3 < 2 then
            return m1_inner + (m2_inner - m1_inner) * (2 / 3 - h_inner) * 6
        else
            return m1_inner
        end
    end

    return inner(m1, m2, h + 1 / 3), inner(m1, m2, h), inner(m1, m2, h - 1 / 3)
end

-----------------------------------------------------------------------------
--- Converts an RGB triplet to HSL.
--- (see http://easyrgb.com)
---
--- @param r number Red component (0.0-1.0)
--- @param g number Green component (0.0-1.0)
--- @param b number Blue component (0.0-1.0)
--- @return number, number, number -- Corresponding H (0-360), S (0.0-1.0) and L (0.0-1.0) components
-----------------------------------------------------------------------------
function Color.rgb_to_hsl(r, g, b)
    --r, g, b = r/255, g/255, b/255
    local min = math.min(r, g, b)
    local max = math.max(r, g, b)
    local delta = max - min

    local h, s, l = 0, 0, ((min + max) / 2)

    if l > 0 and l < 0.5 then
        s = delta / (max + min)
    end
    if l >= 0.5 and l < 1 then
        s = delta / (2 - max - min)
    end

    if delta > 0 then
        if max == r and max ~= g then
            h = h + (g - b) / delta
        end
        if max == g and max ~= b then
            h = h + 2 + (b - r) / delta
        end
        if max == b and max ~= r then
            h = h + 4 + (r - g) / delta
        end
        h = h / 6
    end

    if h < 0 then
        h = h + 1
    end
    if h > 1 then
        h = h - 1
    end

    return h * 360, s, l
end

--- Converts an RGB hex string to HSL values
---
--- @param rgb string RGB color string in format "#RRGGBB"
--- @return number, number, number -- H, S, L values
function Color.rgb_string_to_hsl(rgb)
    return Color.rgb_to_hsl(
        tonumber(rgb:sub(2, 3), 16) / 256,
        tonumber(rgb:sub(4, 5), 16) / 256,
        tonumber(rgb:sub(6, 7), 16) / 256
    )
end

-----------------------------------------------------------------------------
--- Converts the color to an RGB string.
---
--- @return string -- A 6-digit RGB representation of the color prefixed with "#" (suitable for inclusion in HTML)
-----------------------------------------------------------------------------
function Color:to_rgb()
    local rgb = { Color.hsl_to_rgb(self.H, self.S, self.L) }
    local buffer = '#'
    for _, v in ipairs(rgb) do
        buffer = buffer .. string.format('%02x', math.floor(v * 256 + 0.5))
    end
    return buffer
end

-----------------------------------------------------------------------------
--- Creates a new color with hue different by delta.
---
--- @param delta number A delta for hue
--- @return Color -- A new instance of Color
-----------------------------------------------------------------------------
function Color:hue_offset(delta)
    return Color:new((self.H + delta) % 360, self.S, self.L)
end

-----------------------------------------------------------------------------
--- Creates a complementary color.
---
--- @return Color -- A new instance of Color
-----------------------------------------------------------------------------
function Color:complementary()
    return self:hue_offset(180)
end

-----------------------------------------------------------------------------
--- Creates two neighboring colors (by hue), offset by "angle".
---
--- @param angle number|nil The difference in hue between this color and the neighbors (default: 30)
--- @return Color, Color -- Two new instances of Color
-----------------------------------------------------------------------------
function Color:neighbors(angle)
    angle = angle or 30

    return self:hue_offset(angle), self:hue_offset(360 - angle)
end

-----------------------------------------------------------------------------
--- Creates two new colors to make a triadic color scheme.
---
--- @return Color, Color -- Two new instances of Color
-----------------------------------------------------------------------------
function Color:triadic()
    return self:neighbors(120)
end

-----------------------------------------------------------------------------
--- Creates two new colors, offset by angle from this colors complementary.
---
--- @param angle number|nil The difference in hue between the complementary and the returned colors (default: 30)
--- @return Color, Color -- Two new instances of Color
-----------------------------------------------------------------------------
function Color:split_complementary(angle)
    return self:neighbors(180 - (angle or 30))
end

-----------------------------------------------------------------------------
--- Creates a new color with saturation set to a new value.
---
--- @param saturation number The new saturation value (0.0 - 1.0)
--- @return Color -- A new instance of Color
-----------------------------------------------------------------------------
function Color:desaturate_to(saturation)
    return Color:new(self.H, saturation, self.L)
end

-----------------------------------------------------------------------------
--- Creates a new color with saturation set to old saturation times r.
---
--- @param r number The multiplier for the new saturation
--- @return Color -- A new instance of Color
-----------------------------------------------------------------------------
function Color:desaturate_by(r)
    return Color:new(self.H, self.S * r, self.L)
end

-----------------------------------------------------------------------------
--- Creates a new color with lightness set to a new value.
---
--- @param lightness number The new lightness value (0.0 - 1.0)
--- @return Color -- A new instance of Color
-----------------------------------------------------------------------------
function Color:lighten_to(lightness)
    return Color:new(self.H, self.S, lightness)
end

-----------------------------------------------------------------------------
--- Creates a new color with lightness set to old lightness times r.
---
--- @param r number The multiplier for the new lightness
--- @return Color -- A new instance of Color
-----------------------------------------------------------------------------
function Color:lighten_by(r)
    return Color:new(self.H, self.S, self.L * r)
end

-----------------------------------------------------------------------------
--- Creates n variations of this color using supplied function and returns
--- them as a table.
---
--- @param f function The function to create variations
--- @param n number|nil The number of variations (default: 5)
--- @return table<number, Color> -- A table with n values containing the new colors
-----------------------------------------------------------------------------
function Color:variations(f, n)
    n = n or 5
    local results = {}
    for i = 1, n do
        table.insert(results, f(self, i, n))
    end
    return results
end

-----------------------------------------------------------------------------
--- Creates n tints of this color and returns them as a table
---
--- @param n number|nil The number of tints (default: 5)
--- @return table<number, Color> -- A table with n values containing the new colors
-----------------------------------------------------------------------------
function Color:tints(n)
    return self:variations(function(color, i)
        return color:lighten_to(color.L + (1 - color.L) / n * i)
    end, n)
end

-----------------------------------------------------------------------------
--- Creates n shades of this color and returns them as a table
---
--- @param n number|nil The number of shades (default: 5)
--- @return table<number, Color> -- A table with n values containing the new colors
-----------------------------------------------------------------------------
function Color:shades(n)
    return self:variations(function(color, i)
        return color:lighten_to(color.L - color.L / n * i)
    end, n)
end

--- Creates a tint of this color
---
--- @param r number Tint ratio (0.0-1.0)
--- @return Color -- A new instance of Color
function Color:tint(r)
    return self:lighten_to(self.L + (1 - self.L) * r)
end

--- Creates a shade of this color
---
--- @param r number Shade ratio (0.0-1.0)
--- @return Color -- A new instance of Color
function Color:shade(r)
    return self:lighten_to(self.L - self.L * r)
end

Color.__tostring = Color.to_rgb

return Color
