return {
	{
		"bullets-vim/bullets.vim",
		ft = "markdown",
		config = function()
			vim.g.bullets_delete_last_bullets_if_empty = 1
		end,
	},
	{
		"preservim/vim-markdown",
		ft = "markdown",
		config = function()
			-- Customize the folded text. Right now, empty line.
			function MarkdownFoldText()
				return ""
			end

			-- Use an autocommand to set foldtext after the file is loaded
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.opt_local.foldlevel = 99                     -- All fold opens
					vim.opt_local.foldtext = "v:lua.MarkdownFoldText()"
					vim.opt_local.fillchars = "fold: "               -- Remove trailing dots
					vim.api.nvim_set_hl(0, "Folded", { link = "Normal" }) -- Use the "Normal" from the colorscheme
				end,
			})
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
		config = function()
			require('render-markdown').setup({
				code = {
					sign = false,
					disable_background = true,
					border = 'none'
				},
			})
			vim.cmd("highlight @markup.raw.markdown_inline guibg=None")
			vim.cmd("highlight @markup.strong cterm=bold gui=bold guifg=#ff966c")
		end
	},
}
