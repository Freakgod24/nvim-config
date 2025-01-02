-- Will call poetry from the floating terminal
-- Please ensure that pyproject.toml includes
--
-- [tool.poetry.scripts]
-- debug = "{Package}.{file}:{function}"
--
vim.api.nvim_create_autocmd("FileType", {
	desc = "python-specific mappings",
	group = vim.api.nvim_create_augroup("py_mappings", { clear = true }),
	pattern = "python",
	callback = function()
		vim.keymap.set("n", "<F5>", ":Floaterminal poetry run debug<CR>")
	end,
})
