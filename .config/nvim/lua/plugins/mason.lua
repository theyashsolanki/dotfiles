return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = function()
			return {
				ensure_installed = {
					-- lua stuff
					"lua-language-server",
					"stylua",

					-- web dev stuff
					"css-lsp",
					"html-lsp",
					"rustywind",
					"htmlbeautifier",
					"typescript-language-server",
					"deno",
					"prettier",
					"tailwindcss-language-server",
					"emmet-ls",
					-- "eslint-lsp",
					"json-lsp",

					-- shell stuff
					"bash-language-server",
					"shellcheck",
					"beautysh",

					-- c/cpp stuff
					"clangd",
					"clang-format",

					-- python stuff
					"pyright",
					"black",
					"isort",

					-- Golang
					"gopls",
					"gofumpt",
					"goimports-reviser",
				},

				ui = {
					keymaps = {
						apply_language_filter = "F",
					},
				},
			}
		end,
		config = function(_, opts)
			require("mason").setup(opts)

			-- custom nvchad cmd to install all mason binaries listed
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			end, {})

			vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({})
		end,
	},
}
