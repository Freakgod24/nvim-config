return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.icons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			local v = vim.version()

			local centerText = function(text, width)
				local totalPadding = width - #text
				local leftPadding = math.floor(totalPadding / 2)
				local rightPadding = totalPadding - leftPadding
				return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
			end

			local function set_dynamic_layout()
				local total_height = vim.fn.winheight(0)
				local header_height = #dashboard.section.header.val
				local footer_height = #dashboard.section.footer.val
				local button_height = #dashboard.section.buttons.val

				local space_available = total_height - (header_height + footer_height + button_height)
				local padding_top = math.floor(space_available * 0.3)
				local padding_middle = math.floor(space_available * 0.4)
				local padding_bottom = space_available - (padding_top + padding_middle)

				dashboard.opts.layout = {
					{ type = "padding", val = padding_top },
					{ type = "text",    val = dashboard.section.header.val,  opts = { position = "center", hl = "Type" } },
					{ type = "padding", val = padding_middle },
					{ type = "group",   val = dashboard.section.buttons.val, opts = { position = "center" } },
					{ type = "padding", val = padding_bottom },
					{ type = "text",    val = dashboard.section.footer.val,  opts = { position = "center", hl = "Number" } },
				}
			end

			local tryFindGitFiles = function()
				local builtin = require("telescope.builtin")
				local status, err = pcall(builtin.git_files)
				if not status then
					builtin.find_files()
				end
			end

			-- Set header
			dashboard.section.header.val = {
				-- "                                                     ",
				-- "                                                     ",
				-- "                                                     ",
				-- "                                                     ",
				-- "                                                     ",
				-- "                                                     ",
				-- "                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				-- "                                                     ",
			}

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("SPC f f", "󰮗   Find all files", ":Telescope find_files<CR>"),
				dashboard.button("SPC f F", "   Find git files", tryFindGitFiles),
				dashboard.button("SPC f o", "   Recent", ":Telescope oldfiles<CR>"),
				dashboard.button(
					"SPC f c",
					"   Configuration",
					":e " .. vim.fn.stdpath("config") .. "/init.lua<CR>"
				),
				dashboard.button("SPC f w", "󱘞   Live Grep", ":Telescope live_grep<CR>"),
				dashboard.button("SPC q", "󰗼   Quit", ":qa<CR>"),
			}

			dashboard.section.footer.val = {
				-- "",
				-- "",
				-- "",
				-- "",
				centerText("🔧 Let's Code Something Amazing Today! 🔧", 50),
				" ",
				centerText(os.date("%H:%M"), 50),
				centerText(os.date("%a %d %b"), 50),
				centerText("  v" .. v.major .. "." .. v.minor .. "." .. v.patch, 50),
			}

			set_dynamic_layout()

			-- Send config to alpha
			alpha.setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
			--
			-- Auto-update layout on window resize
			vim.api.nvim_create_autocmd("VimResized", {
				pattern = "*",
				callback = function()
					set_dynamic_layout()
					alpha.redraw()
				end,
			})
		end,
	},
}
