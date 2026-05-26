return vim.schedule_wrap(function()
    vim.cmd('redrawstatus')
end)
