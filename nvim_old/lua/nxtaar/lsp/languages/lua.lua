local lsp_zero = require("lsp-zero")

return {
	lua_ls = lsp_zero.nvim_lua_ls({
		settings = {
			Lua = {
				format = {
					defaultConfig = {
						quote_style = "single",
					},
				},
			},
		},
	}),
}
