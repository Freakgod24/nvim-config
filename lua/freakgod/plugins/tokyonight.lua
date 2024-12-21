return
{
	{                -- Theme
		"folke/tokyonight.nvim",
		priority = 1000, -- First to load
		init = function()
			vim.cmd.colorscheme("tokyonight-night")
			vim.cmd.hi("Comment gui=none")
		end,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	}
}
