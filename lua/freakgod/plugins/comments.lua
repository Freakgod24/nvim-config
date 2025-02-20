return
{
	"numToStr/Comment.nvim", -- Toggle comment easily
	{                       -- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
		config = function()
			require("todo-comments").setup({})
			vim.keymap.set("n", "<leader>ft", ":Trouble todo<CR>", { desc = "[F]ind [T]odos" })
			vim.keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next Todo" })
			vim.keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous Todo" })
		end,
	}
}
