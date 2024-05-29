local git_repo = require('nxtaar.tools.telescope_pretty_entry.tokens.git_repo')
local buffer_number = require('nxtaar.tools.telescope_pretty_entry.tokens.buffer_number')
local unsaved = require('nxtaar.tools.telescope_pretty_entry.tokens.unsaved')
local file = require('nxtaar.tools.telescope_pretty_entry.tokens.file')

return {
    git_repo = git_repo,
    unsaved = unsaved,
    buffer_number = buffer_number,
    file = file
}
