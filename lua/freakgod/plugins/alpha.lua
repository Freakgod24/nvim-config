return
{
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.icons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			local time = os.date("%H:%M")
			local date = os.date("%a %d %b")
			local v = vim.version()
			local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

			-- Set header
			dashboard.section.header.val = {
				"",
				"",
				"",
				"",
				"███    ██ ███████  ██████  ██    ██ ██ ███    ███",
				"████   ██ ██      ██    ██ ██    ██ ██ ████  ████",
				"██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██",
				"██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██",
				"██   ████ ███████  ██████    ████   ██ ██      ██",
				"",
				"",
				"",
				"",
			}
			function TryFindGitFiles()
				local builtin = require("telescope.builtin")
				local status, err = pcall(builtin.git_files)
				if not status then
					builtin.find_files()
				end
			end

			dashboard.section.buttons.val = {
				dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("SPC f f", "   Find git files", TryFindGitFiles),
				dashboard.button("SPC f F", "󰮗   Find all files", ":Telescope find_files<CR>"),
				dashboard.button("SPC f o", "   Recent", ":Telescope oldfiles<CR>"),
				dashboard.button(
					"SPC f c",
					"   Configuration",
					":e " .. vim.fn.stdpath("config") .. "/init.lua<CR>"
				),
				dashboard.button("SPC f w", "󱘞   Live Grep", ":Telescope live_grep<CR>"),
				dashboard.button("SPC q", "󰗼   Quit", ":qa<CR>"),
			}

			function centerText(text, width)
				local totalPadding = width - #text
				local leftPadding = math.floor(totalPadding / 2)
				local rightPadding = totalPadding - leftPadding
				return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
			end

			dashboard.section.footer.val = {
				"",
				"",
				"",
				"",
				centerText("🔧 Let's Code Something Amazing Today! 🔧", 50),
				" ",
				centerText(date, 50),
				centerText(time, 50),
				centerText(version, 50),
			}

			-- Send config to alpha
			alpha.setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		end,
	}
}
