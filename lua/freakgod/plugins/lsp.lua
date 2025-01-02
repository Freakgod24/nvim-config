return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = { notification = { window = { winblend = 0 } } } }, -- Status updates bottom right of the screen
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			--  NOTE: *** Language Servers ***
			local servers = {
				clangd = {},
				gopls = {},
				pyright = {},
				rust_analyzer = {},
				vtsls = {},
			}

			--  NOTE: *** Code Autoformat ***
			local formatters = {
				stylua = {},
				black = {},
				luaformatter = {},
			}

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "" .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("gs", require("telescope.builtin").lsp_document_symbols, "[G]oto [S]ymbols")
					map("gS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[G]oto All [S]ymbols")
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			require("mason").setup()
			local ensure_installed = vim.tbl_keys({})
			vim.list_extend(ensure_installed, servers)
			vim.list_extend(ensure_installed, formatters)
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for ts_ls)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
