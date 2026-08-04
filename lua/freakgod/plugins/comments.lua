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

			local section_namespace = vim.api.nvim_create_namespace("go-section-comments")
			vim.api.nvim_set_decoration_provider(section_namespace, {
				on_win = function(_, _, buffer)
					return vim.bo[buffer].filetype == "go"
				end,
				on_line = function(_, _, buffer, row)
					local line = vim.api.nvim_buf_get_lines(buffer, row, row + 1, false)[1]
					local _, _, title_start, _, title_end = line:find("/%* %-%-%-%- ()(.-)() %-%-%-%- %*/")
					if title_start then
						vim.api.nvim_buf_set_extmark(buffer, section_namespace, row, title_start - 1, {
							end_col = title_end - 1,
							hl_group = "TodoBgTODO",
							ephemeral = true,
							priority = 500,
						})
					end
				end,
			})

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
