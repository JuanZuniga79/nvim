local installed = {
	"lua",
	"angular",
	"astro",
	"bash",
	"c",
	"c_sharp",
	"cmake",
	"cpp",
	"css",
	"csv",
	"dart",
	"gdscript",
	"fsharp",
	"gitignore",
	"go",
	"gomod",
	"gosum",
	"graphql",
	"groovy",
	"html",
	"htmldjango",
	"hyprlang",
	"java",
	"javadoc",
	"javascript",
	"json5",
	"kotlin",
	"markdown",
	"markdown_inline",
	"nginx",
	"nix",
	"prisma",
	"python",
	"razor",
	"regex",
	"rust",
	"sql",
	"svelte",
	"styled",
	"terraform",
	"toml",
	"typescript",
	"tsx",
	"ungrammar",
	"vue",
	"vim",
	"xml",
	"yaml",
	"zig",
}

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autotag = {
				enable = true,
			},
			ensure_installed = installed,
			auto_install = true,
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			rainbow = {
				enable = true,
				disable = {},
				extended_mode = false,
				max_file_lines = nil,
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})
	end,
}
