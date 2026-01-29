local consts = {
    palette = require('nxtaar.editor.statusline.constants.palette'),
    mode = require('nxtaar.editor.statusline.constants.mode'),
}

local Mode = require('nxtaar.editor.statusline.components.mode')
local GitRepo = require('nxtaar.editor.statusline.components.git_repo')
local GitBranch = require('nxtaar.editor.statusline.components.git_branch')
local Filename = require('nxtaar.editor.statusline.components.filename')

local theme_utils = require('nxtaar.editor.statusline.utils.theme')
local heirline_utils = require('heirline.utils')
local theme = theme_utils.extract_theme(consts.palette.palette_extract_info)

local mode_colors = {}
local default_hl = heirline_utils.get_highlight('Normal')

local Space = { provider = ' ' }

local LeftSection = {
    Mode,
    Space,
    GitRepo,
    Space,
    GitBranch,
}

local CenterSection = {
    Filename,
}

local RightSection = {}

local function render_section(sl)
    sl:eval()

    local s = sl:traverse()
    return s, heirline_utils.count_chars(s)
end

local function render_root(left, center, right)
    local win_w = vim.o.columns

    local ls, lw = render_section(left)
    local cs, cw = render_section(center)
    local rs, rw = render_section(right)

    local target_left = math.floor((win_w - cw) / 2)
    local pad_left = math.max(target_left - lw, 0)
    local pad_right = math.max(win_w - (lw + pad_left + cw + rw), 0)

    return table.concat({
        ls,
        string.rep(' ', pad_left),
        cs,
        string.rep(' ', pad_right),
        rs,
    })
end

return {
    static = {
        sections = {},
        consts = consts,
        default_hl = default_hl,
        mode_color = function(self, current_mode)
            local color = mode_colors[current_mode]

            if color == nil then
                local mode_palette =
                    self.consts.mode.modes[current_mode].palette
                color = theme_utils.build_color(theme[mode_palette], theme.text)
                mode_colors[current_mode] = color
            end

            return color
        end,
        get_section = function(self, section)
            if self.sections[section] == nil then
                self.sections[section] = self:new(section)
            end

            return self.sections[section]
        end,
    },
    hl = default_hl,
    restrict = {
        sections = true,
        get_section = true,
    },
    provider = function(self)
        return render_root(
            self:get_section(LeftSection),
            self:get_section(CenterSection),
            self:get_section(RightSection)
        )
    end,
}
