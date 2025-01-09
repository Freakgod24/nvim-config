return {
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").opts.preview_filter = function()
				return false
			end
			vim.keymap.set({ "n" }, "s", function()
				require('leap').leap {
					offset = 2,
					target_windows = { vim.api.nvim_get_current_win() }
				}
			end)
		end,
	},
}
