return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		})


		vim.cmd("colorscheme tokyonight")
		vim.cmd("highlight DiagnosticVirtualTextError guibg=None")
		vim.cmd("highlight DiagnosticVirtualTextWarn guibg=None")
		vim.cmd("highlight DiagnosticVirtualTextInfo guibg=None")
		vim.cmd("highlight DiagnosticVirtualTextHint guibg=None")
	end,
}
