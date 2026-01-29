return {
    filter = {
        event = 'msg_show',
        any = {
            { find = '%d+L, %d+B' },
            { find = '; after #%d+' },
            { find = '; before #%d+' },
        },
    },
    view = 'mini',
}
