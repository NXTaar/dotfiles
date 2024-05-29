local strwidth = vim.fn.strwidth
local repo_icon = ''

return {
    hide = function(meta)
        return meta.without_repos
    end,
    group = {
        {
            width = function()
                return strwidth(repo_icon)
            end,
            content = function(entry)
                if entry.no_repo then
                    return ''
                end
                return repo_icon
            end
        },
        {
            width = function(meta)
                return meta.longest_repo_name_length
            end,
            content = function(entry)
                if entry.no_repo then
                    return '-- no repo --'
                end

                return entry.repo
            end,
            hl = function(entry)
                if entry.no_repo then
                    return 'TelescopeResultsComment'
                end
                return 'TelescopePreviewDirectory'
            end
        }
    }
}
