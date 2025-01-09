return {
	{
		"bullets-vim/bullets.vim",
		config = function()
			vim.g.bullets_delete_last_bullets_if_empty = 1
		end
	},
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true, -- or `opts = {}`
	},
}
