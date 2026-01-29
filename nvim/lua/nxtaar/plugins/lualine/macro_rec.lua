local is_recording_visible = true
local flicker_timer = nil

-- Timer start
local function start_flicker_timer()
    if flicker_timer ~= nil then
        return
    end -- already running
    flicker_timer = vim.loop.new_timer()
    ---@diagnostic disable-next-line: need-check-nil
    flicker_timer:start(
        0,
        700,
        vim.schedule_wrap(function()
            is_recording_visible = not is_recording_visible
            vim.cmd('redrawstatus')
        end)
    )
end

-- Timer stop
local function stop_flicker_timer()
    if flicker_timer then
        flicker_timer:stop()
        flicker_timer:close()
        flicker_timer = nil
        is_recording_visible = true -- reset visibility
        vim.cmd('redrawstatus')
    end
end

-- Autocommands
vim.api.nvim_create_autocmd('RecordingEnter', {
    callback = function()
        start_flicker_timer()
    end,
})

vim.api.nvim_create_autocmd('RecordingLeave', {
    callback = function()
        stop_flicker_timer()
    end,
})

local macro_rec = {
    function()
        local reg = vim.fn.reg_recording()

        if reg == '' then
            return ''
        end

        return (is_recording_visible and '󰧞' or '')
            .. ' recording @'
            .. reg
    end,
    color = { fg = '#e8274b' },
    separator = '',
}

vim.opt.shortmess:append('q')

return macro_rec
