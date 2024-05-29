local devicons = require('nvim-web-devicons')
local utils = require('nxtaar.tools.telescope_pretty_buffers.utils')

return function(entry)
    local bufname = entry.info.name ~= '' and entry.info.name or '[No Name]'
    local file_name = vim.fn.fnamemodify(bufname, ':p:t')
    local glyph, highlight = devicons.get_icon(bufname, string.match(bufname, '%a+$'), { default = true })
    local dir_name = vim.fn.fnamemodify(bufname, ':p:h')
    local repo = utils.get_buffer_repo_name(entry.bufnr)
    local no_repo = repo == ''

    return {
        ordinal = repo,
        bufnr = entry.bufnr,
        changed = entry.info.changed == 1,
        repo = repo,
        no_repo = no_repo,
        icon = {
            glyph = glyph,
            highlight = highlight
        },
        file_name = file_name,
        dir_name = dir_name,
    }
end
