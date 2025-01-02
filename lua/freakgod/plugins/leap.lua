return {
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").opts.preview_filter = function()
				return false
			end
			vim.keymap.set({ "n" }, "s", "<Plug>(leap)")
		end,
	},
}
