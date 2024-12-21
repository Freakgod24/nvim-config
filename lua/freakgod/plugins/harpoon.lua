return
{
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		config = function()
			require("harpoon").setup({ settings = { save_on_toggle = true } })
		end,
		keys = {
			{
				"<leader>ha",
				function()
					require("harpoon"):list():add()
				end,
				mode = { "n" },
				desc = "Add to Harpoon",
			},
			{
				"<leader>hh",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				mode = { "n" },
				desc = "Toggle Harpoon",
			},
			{
				"<leader>h1",
				function()
					require("harpoon"):list():select(1)
				end,
				mode = { "n" },
				desc = "Open harpoon item 1",
			},
			{
				"<leader>h2",
				function()
					require("harpoon"):list():select(2)
				end,
				mode = { "n" },
				desc = "Open harpoon item 2",
			},
			{
				"<leader>h3",
				function()
					require("harpoon"):list():select(3)
				end,
				mode = { "n" },
				desc = "Open harpoon item 3",
			},
			{
				"<leader>h4",
				function()
					require("harpoon"):list():select(4)
				end,
				mode = { "n" },
				desc = "Open harpoon item 4",
			},
			{
				"[h",
				function()
					require("harpoon"):list():prev()
				end,
				mode = { "n" },
				desc = "Previous harpoon",
			},
			{
				"]h",
				function()
					require("harpoon"):list():next()
				end,
				mode = { "n" },
				desc = "Next harpoon",
			},
		},
	}
}
