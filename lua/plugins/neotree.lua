return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		{
			"s1n7ax/nvim-window-picker",
			version = "2.*",
			config = function()
				require("window-picker").setup({
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						bo = {
							filetype = { "neo-tree", "neo-tree-popup", "notify" },
							buftype = { "terminal", "quickfix" },
						},
					},
				})
			end,
		},
	},
	config = function()
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = " ",
				},
			},
		})
		require("neo-tree").setup({
			source_selector = {
				truncation_character = "...",
			},
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
			open_files_using_relative_paths = false,
			sort_case_insensitive = false,
			sort_function = function(a, b)
				if a.type == "directory" and b.type ~= "directory" then
					return true
				elseif a.type ~= "directory" and b.type == "directory" then
					return false
				end
				return a.path < b.path
			end,
			default_container_configs = {
				indent = {
					indent_size = 4,
				},
				container = {
					enable_character_fade = true,
				},
				modified = {
					symbol = " ",
					highlight = "NeoTreeModified",
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
				git_status = {
					symbols = {
						--- change type
						added = " ",
						modified = " ",
						--- status type
						untracked = " ",
						ignored = "󰈉 ",
						unstaged = "󱧙 ",
						staged = "󱧘 ",
						conflict = " ",
					},
				},
			},
			window = {
				position = "left",
				width = 45,
			},
			filesystem = {
				hide_gitignore = true,
				hide_by_name = {
					"node_modules",
				},
			},
		})
	end,
	lazy = false,
	---@module "neo-tree"
	---@type neotree.Config?
}
