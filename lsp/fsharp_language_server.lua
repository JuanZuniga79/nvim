local util = require("lspconfig.util")

return {
	cmd = { "dotnet", "FSharpLanguageServer.dll" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		on_dir(util.root_pattern("*.sln", "*.fsproj", ".git")(fname))
	end,
	filetypes = { "fsharp" },
	init_options = {
		AutomaticWorkspaceInit = true,
	},
	settings = {},
}
