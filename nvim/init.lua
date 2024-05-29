require('nxtaar.spec')
require('nxtaar.settings')
require('nxtaar.commands')
require('nxtaar.keymapper')

spec('nxtaar.lsp.setup')

spec('nxtaar.editor.code_completion')
spec('nxtaar.editor.treesitter')
spec('nxtaar.editor.colorscheme')
spec('nxtaar.editor.bottom_line')
-- spec('nxtaar.editor.comments')
spec('nxtaar.editor.navigation')
spec('nxtaar.editor.undo')
spec('nxtaar.editor.start_screen')
spec('nxtaar.editor.markdown-preview')

-- будет в рамках другого плагина
-- spec('nxtaar.editor.notifications')

spec('nxtaar.tools.git')
spec('nxtaar.tools.fs_navigation')
spec('nxtaar.tools.problems')
spec('nxtaar.tools.reformatting')
spec('nxtaar.tools.telescope')
spec('nxtaar.tools.project')
require('nxtaar.tools.buffers')

require('nxtaar.launch')
