vim.api.nvim_create_autocmd("FileType", {
	desc = "python-specific mappings",
	group = vim.api.nvim_create_augroup("pytest_mappings", { clear = true }),
	pattern = "python",
	callback = function()
		vim.keymap.set("n", "<leader>tw", function()
				local word = vim.fn.expand("<cword>")
				local cmd = ":Floaterminal push-location " ..
						vim.fn.expand("%:p:h") .. ";pytest -k " .. word .. ";pop-location"
				vim.cmd(cmd)
			end,
			{
				desc = "Test current [w]ord in pytest"
			})
		vim.keymap.set("n", "<leader>tm", function()
				local node = vim.treesitter.get_node()
				while node do
					if node:type() == "function_definition" then
						local bufnr = vim.api.nvim_get_current_buf()
						local method = vim.treesitter.get_node_text(node:child(1), bufnr)
						local cmd = ":Floaterminal push-location " ..
								vim.fn.expand("%:p:h") .. ";pytest -k " .. method .. ";pop-location"
						vim.cmd(cmd)
						print(method)
						return
					end
					node = node:parent()
				end
				print("No method found")
			end,
			{
				desc = "Test current [m]ethod in pytest"
			})
	end,
})
