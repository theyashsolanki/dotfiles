local util = require("lspconfig.util")
-- Setup language servers.
local lspconfig = require("lspconfig")
local servers = {
	"lua_ls",
	"clangd",
	"tsserver",
	"gopls",
	"html",
	"cssls",
	"tailwindcss",
	-- "emmet_ls",
	"emmet_language_server",
	"jsonls",
	"bashls",
	"pyright",
}
for _, lsp in ipairs(servers) do
	if lsp == "tsserver" then
		lspconfig[lsp].setup({
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			disable_formatting = true,
		})
	elseif lsp == "gopls" then
		lspconfig[lsp].setup({
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					-- completionUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})
	elseif lsp == "lua_ls" then
		lspconfig[lsp].setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	elseif lsp == "clangd" then
		lspconfig[lsp].setup({
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
				"--inlay-hints",
				"--background-index",
				"--clang-tidy",
				"--suggest-missing-includes",
				"--all-scopes-completion",
			},
		})
	else
		lspconfig[lsp].setup({})
	end
end
