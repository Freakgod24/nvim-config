return {
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Esc>", vim.cmd.NoiceDismiss, desc = "󰎟 Clear notifications" },
		},
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				cmdline = {
					view = "cmdline",
					format = {
						cmdline = { pattern = "^:", icon = ":", lang = "vim" },
					},
				},
				routes = {
					{
						view = "notify",
						filter = { event = "msg_showmode" },
					},
					{
						view = "split",
						filter = { event = "msg_show", min_height = 5 },
					},
				},
			})
		end,
	},
}
