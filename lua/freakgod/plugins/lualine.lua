return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		local dracula_colors = {
			gray = "#44475a",
			lightgray = "#5f6a8e",
			orange = "#ffb86c",
			purple = "#bd93f9",
			red = "#ff5555",
			yellow = "#f1fa8c",
			green = "#50fa7b",
			white = "#f8f8f2",
			black = "#282a36",
		}
		local tokyo_colors, _ = require("tokyonight.colors").setup({
			style = "night",
		})

		local my_lualine_theme = {
			normal = {
				a = { bg = tokyo_colors.blue, fg = tokyo_colors.black, gui = "bold" },
				b = { bg = tokyo_colors.none, fg = tokyo_colors.blue },
				c = { bg = tokyo_colors.none, fg = tokyo_colors.fg_sidebar },
			},
			insert = {
				a = { bg = dracula_colors.green, fg = dracula_colors.black },
				b = { bg = tokyo_colors.fg_gutter, fg = tokyo_colors.green },
				-- c = { bg = tokyo_colors.gray, fg = tokyo_colors.white },
			},
			visual = {
				a = { bg = dracula_colors.yellow, fg = dracula_colors.black },
				b = { bg = tokyo_colors.fg_gutter, fg = dracula_colors.yellow },
				-- c = { bg = tokyo_colors.gray, fg = tokyo_colors.white },
			},
			replace = {
				a = { bg = dracula_colors.red, fg = dracula_colors.black },
				b = { bg = tokyo_colors.fg_gutter, fg = dracula_colors.red },
				-- c = { bg = tokyo_colors.gray, fg = tokyo_colors.white },
			},
			command = {
				a = { bg = tokyo_colors.yellow, fg = dracula_colors.black },
				b = { bg = tokyo_colors.fg_gutter, fg = tokyo_colors.yellow },
				-- c = { bg = tokyo_colors.gray, fg = tokyo_colors.white },
			},
			inactive = {
				a = { bg = tokyo_colors.bg_statusline, fg = tokyo_colors.blue },
				b = { bg = tokyo_colors.bg_statusline, fg = tokyo_colors.fg_gutter, gui = "bold" },
				c = { bg = tokyo_colors.bg_statusline, fg = tokyo_colors.fg_gutter },
			},
		}

		local filetype_map = {
			lazy = { name = "lazy.nvim", icon = "💤" },
			oil = {
				name = vim.fn.getcwd(),
				icon = "📂",
			},
			mason = { name = "mason", icon = "🔨" },
			TelescopePrompt = { name = "telescope", icon = "🔍" },
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				icons_enabled = true,
				theme = my_lualine_theme,
				component_separators = "",
				section_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = { statusline = { "alpha" } },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icon = "",
					},
				},
				lualine_b = { "branch" },
				lualine_c = {
					{
						"filename",
						fmt = function(name)
							if filetype_map[vim.bo.filetype] then
								return filetype_map[vim.bo.filetype].icon .. " " .. filetype_map[vim.bo.filetype].name
							else
								return name
							end
						end,
					},
					"diagnostics",
				},
				lualine_y = { "progress", "location" },
				lualine_z = { { "datetime", style = "  %X" } },
			},
		})
	end,
}
