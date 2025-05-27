return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "biome" },
				typescriptreact = { "biome" },
				json = { "biome" },
				css = { "biome" },
				graphql = { "biome" },
				htmlangular = { "biome" },
				python = function(bufnr)
					if conform.get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "fallback",
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		})
	end,
}
