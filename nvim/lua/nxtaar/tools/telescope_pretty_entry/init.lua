local create_display_fn = require('nxtaar.tools.telescope_pretty_entry.display')
local utils = require('nxtaar.tools.telescope_pretty_entry.utils')

return function(config)
    local display = create_display_fn(config.row, config.meta)

    return function(raw_entry)
        local entry = {
            valid = true,
            value = raw_entry,
            display = display,
            ordinal = utils.uuid()
        }

        return vim.tbl_deep_extend('force', entry, config.map_entry(raw_entry, config.meta))
    end
end
