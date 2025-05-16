return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"whoIsSethDaniel/mason-tool-installer.nvim",
	},
	priority = 100,
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"tailwindcss",
				"jdtls",
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"selene",
				"biome",
				"codespell",
			},
		})
	end,
}
