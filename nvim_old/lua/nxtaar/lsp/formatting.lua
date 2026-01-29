local languages = require("nxtaar.lsp.lang_list")

local fos_options = {
	lsp_fallback = true,
	async = false,
	timeout_ms = 500,
}

return {
	formatters_by_ft = languages.formatting,
	format_on_save = fos_options,
}
