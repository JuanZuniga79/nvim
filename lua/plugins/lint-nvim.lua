return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			lua = { "selene" },
			typescript = { "biome" },
			typescriptreact = { "biome" },
			astro = { "biome" },
			json = { "biome" },
			css = { "biome" },
			python = { "ruff" },
			htmlangular = { "biome" },
		}
	end,
}
