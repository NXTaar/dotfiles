return {
    filter = {
        event = 'msg_show',
        kind = '',
        find = 'written',
    },
    view = 'mini',
    opts = {
        format = { { '', hl_group = 'DiagnosticOk' }, ' written!' }
    }
}
