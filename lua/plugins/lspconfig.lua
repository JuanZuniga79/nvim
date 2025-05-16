return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{
			"folke/lazydev.nvim",
			tf = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local nvim_lsp = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local protocol = require("vim.lsp.protocol")
		local on_attach = function(client, bufnr) end
		local web_attach = function(_, bufnr)
			require("tailwindcss-colors").buf_attach(bufnr)
		end
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		mason_lspconfig.setup_handlers({
			function(server)
				nvim_lsp[server].setup({
					capabilities = capabilities,
				})
			end,
			nvim_lsp["lua_ls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			}),
			nvim_lsp["ts_ls"].setup({
				on_attach = web_attach,
				capabilities = capabilities,
			}),
			nvim_lsp["tailwindcss"].setup({
				on_attach = web_attach,
				capabilities = capabilities,
			}),
			nvim_lsp["cssls"].setup({
				on_attach = web_attach,
				capabilities = capabilities,
			}),
			nvim_lsp["jdtls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			}),
		})
	end,
}
