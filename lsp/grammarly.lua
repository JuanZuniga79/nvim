return {
	cmd = { "grammarly-languageserver", "--stdio" },
	filetypes = { "markdown" },
	root_markers = { ".git" },
	handlers = {
		["$/updateDocumentState"] = function()
			return ""
		end,
	},
	init_options = {
		clientId = "client_BaDkMgx4X19X9UxxYRCXZo",
	},
}
