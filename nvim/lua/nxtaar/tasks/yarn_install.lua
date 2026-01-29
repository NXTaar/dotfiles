return {
    -- Required fields
    name = 'yarn_install',
    desc = 'Install node dependencies using yarn',
    builder = function()
        -- This must return an overseer.TaskDefinition
        return {
            cmd = { 'yarn' },
            -- additional arguments for the cmd
            args = { 'install' },
        }
    end,
    priority = 50,
    condition = {
        callback = function(search)
            local target = vim.fs.find('package.json', {
                path = search.dir,
                upward = true,
                limit = 1,
                type = 'file',
            })

            return #target > 0
        end,
    },
}
