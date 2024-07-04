require('nxtaar.spec')
require('nxtaar.settings')
require('nxtaar.commands')
require('nxtaar.keymapper')

spec('nxtaar.lsp.setup')
spec('nxtaar.editor')

spec('nxtaar.tools.git')
spec('nxtaar.tools.fs_navigation')
spec('nxtaar.tools.tasks_runner')
spec('nxtaar.tools.problems')
spec('nxtaar.tools.reformatting')
spec('nxtaar.tools.telescope')
spec('nxtaar.tools.project')

require('nxtaar.tools.buffers')

require('nxtaar.launch')
