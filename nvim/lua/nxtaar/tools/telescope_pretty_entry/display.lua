local entry_display = require('telescope.pickers.entry_display')
local strwidth = vim.fn.strwidth

local function compute_separator(config, index)
    local separator_type = type(config.separator)
    local custom_separator = separator_type == 'string'
    local with_separator = (config.separator == nil or custom_separator) and index > 1
    local separator_symbol = custom_separator and config.separator or ' ';
    local separator_symbol_length = strwidth(separator_symbol)
    local separator_check = with_separator and 1 or 0

    return {
        present = with_separator,
        symbol = separator_symbol,
        length = separator_symbol_length,
        present_as_number = separator_check
    }
end

local function calculate_dimensions(config, meta, separator)
    local column = { width = nil }
    local width_type = type(config.width)

    if width_type == 'function' then
        local calculated_width = config.width(meta)
        local resulted_width = calculated_width ~= nil
            and calculated_width + separator.length * separator.present_as_number
            or nil
        column = { width = resulted_width }
    end

    if width_type == 'number' then
        column = { width = config.width + separator.length * separator.present_as_number }
    end

    if config.remaining then
        column = { remaining = true }
    end

    return column
end

local function create_all_with_fn(length)
    return function(hl)
        return { { { 0, length }, hl } }
    end
end

local function build_render_function(config, meta, separator)
    return function(entry)
        local content = config.content ~= nil and tostring(config.content(entry, meta)) or ''
        local hl = nil
        local hl_type = type(config.hl)
        local hl_range_type = type(config.hl_range)

        if #content > 0 and separator.present then
            content = separator.symbol .. content
        end

        if (hl_type == 'string') then
            hl = config.hl
        end

        if (hl_type == 'function') then
            hl = config.hl(entry, meta)
        end

        if (hl_range_type == 'function') then
            local max_length = strwidth(content)
            local all_with = create_all_with_fn(max_length)
            hl = function()
                return config.hl_range(entry, meta, all_with)
            end
        end

        return hl and { content, hl } or content
    end
end

local function resolve_setup(item, meta, index)
    local separator = compute_separator(item, index)
    return {
        calculate_dimensions(item, meta, separator),
        build_render_function(item, meta, separator)
    }
end

local function create_display_fn(setup, meta)
    local columns = {}
    local column_value_renderers = {}
    local tokens = {}

    for _, config in ipairs(setup) do
        local hide_token = config.hide ~= nil and config.hide(meta) or false

        if not hide_token then
            local items = config.group or { config }

            for _, token in ipairs(items) do
                tokens[#tokens + 1] = token
            end
        end
    end

    for index, config in ipairs(tokens) do
        local column, renderer = unpack(resolve_setup(config, meta, index))
        columns[#columns + 1] = column
        column_value_renderers[#column_value_renderers + 1] = renderer
    end

    local displayer = entry_display.create({
        separator = '',
        items = columns
    })

    local display = function(entry)
        local render_result = {}

        for _, renderer in ipairs(column_value_renderers) do
            render_result[#render_result + 1] = renderer(entry)
        end

        return displayer(render_result)
    end

    return display
end

return create_display_fn
