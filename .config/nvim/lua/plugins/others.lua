return {
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	},

	{
		"christoomey/vim-tmux-navigator",
		config = function()
			vim.g.tmux_navigator_no_mappings = 1
		end,
	},

	{
		"mrjones2014/smart-splits.nvim",
		-- version = "^1",
		-- optional = true,
		config = function()
			require("smart-splits").setup()
		end,
	},
	{
		"mbbill/undotree",
		event = { "BufReadPre" },
		config = function() end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"numToStr/Comment.nvim",
		-- event = { "BufReadPre", "BufNewFile" },
		config = true, -- runs require('Comment').setup()
	},

	{
		"vimwiki/vimwiki",
		config = function() end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
