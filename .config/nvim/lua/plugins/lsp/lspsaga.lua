return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			hover = {
				open_link = "<CR>",
				open_cmd = "!firefox",
			},
			lightbulb = {
				enable = false,
				-- enable_in_insert = false,
			},
			rename = {
				keys = {
					quit = "<C-c>",
				},
			},
			finder = {
				default = "ref",
			},
		})
	end,
}
