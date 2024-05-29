local telescope = require('telescope.builtin')
local action_state = require('telescope.actions.state')
local action_utils = require('telescope.actions.utils')
local themes = require('telescope.themes')
local telescope_actions = require('telescope.actions')
local ask_to_confirm = require('nxtaar.tools.telescope_pretty_buffers.utils').ask_to_confirm
local calculate_meta = require('nxtaar.tools.telescope_pretty_buffers.meta').calculate_meta
local update_selection = require('nxtaar.tools.telescope_pretty_buffers.meta').update_selection
local buffers_entry = require('nxtaar.tools.telescope_pretty_buffers.entry')
local pretty_entry_maker = require('nxtaar.tools.telescope_pretty_entry')
local tokens = require('nxtaar.tools.telescope_pretty_entry.tokens')

return function()
    local meta = calculate_meta()

    local entry_maker = pretty_entry_maker({
        meta = meta,
        map_entry = buffers_entry,
        row = { tokens.buffer_number, tokens.git_repo, tokens.unsaved, tokens.file }
    })

    telescope.buffers(themes.get_dropdown({
        entry_maker = entry_maker,
        previewer = false,
        multi_icon = '',
        attach_mappings = function(_, map)
            map({ 'i', 'n' }, '<Tab>', function(prompt_bufnr)
                telescope_actions.toggle_selection(prompt_bufnr)
                local picker = action_state.get_current_picker(prompt_bufnr)

                local selected = {}

                action_utils.map_selections(prompt_bufnr, function(entry)
                    selected[entry.bufnr] = true
                end)

                update_selection(selected)

                vim.print('updated')
                picker:move_selection(0)
            end)
            map({ 'i', 'n' }, '<S-Tab>', telescope_actions.toggle_selection)

            map('n', 'dd', function(prompt_bufnr)
                local picker = action_state.get_current_picker(prompt_bufnr)
                local selection = picker:get_multi_selection()
                local num_selections = #selection

                if num_selections == 0 then
                    return
                end

                if num_selections == 1 then
                    return telescope_actions.delete_buffer(prompt_bufnr)
                end

                local confirmation = ask_to_confirm(string.format("Delete '%s' buffers? [y/n]: ", num_selections))

                if confirmation then
                    telescope_actions.delete_buffer(prompt_bufnr)
                end
            end)
            return true
        end,
    }))
end
