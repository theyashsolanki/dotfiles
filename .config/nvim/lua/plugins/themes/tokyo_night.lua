return {
	"folke/tokyonight.nvim",
	config = function()
		local colorscheme = require("core.colorscheme")
		require("tokyonight").setup({
			transparent = colorscheme.transparent,
			style = "moon",
			styles = {
				sidebars = colorscheme.style,
				floats = colorscheme.style,
			},
			on_highlights = function(hl, c)
				local prompt = "#2d3149"
				hl.TelescopeBorder = {
					fg = "#2d3149",
				}
				hl.TelescopePromptBorder = {
					fg = prompt,
				}
				hl.TelescopePromptTitle = {
					fg = "#808080",
				}
				hl.TelescopePreviewTitle = {
					fg = "#808080",
				}
			end,
		})
		vim.cmd("colorscheme " .. colorscheme.theme)
	end,
}
