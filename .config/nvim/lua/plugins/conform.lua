return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				javascript = { "deno_fmt" },
				typescript = { "deno_fmt" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				html = { "htmlbeautifier", "rustywind" },
				css = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				cpp = { "clang-format" },
				go = { "goimports-reviser", "gofumpt" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
