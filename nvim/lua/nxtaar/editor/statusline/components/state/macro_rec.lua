return {
    init = function(self)
        local register = vim.fn.reg_recording()
        local is_recording = register ~= ''

        self.state.macro_rec = {
            register = register,
            is_recording = is_recording,
        }
    end,
    update_event = {
        'RecordingEnter',
        'RecordingLeave',
    },
}
