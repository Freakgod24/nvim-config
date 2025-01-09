--
-- NOTE: *** General Keymaps ***

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear highlights after searches
vim.keymap.set("n", "<leader>cd", vim.diagnostic.setloclist, { desc = "Show [d]iagnostic (Quickfix)" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" }) -- Or do <C-\><C-n> if not working
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<leader><left>", "<C-w><C-h>", { desc = "which_key_ignore" })
vim.keymap.set("n", "<leader><right>", "<C-w><C-l>", { desc = "which_key_ignore" })
vim.keymap.set("n", "<leader><down>", "<C-w><C-j>", { desc = "which_key_ignore" })
vim.keymap.set("n", "<leader><up>", "<C-w><C-k>", { desc = "which_key_ignore" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>n", ":vnew<CR>:set filetype=markdown<CR>", { desc = "Open a new [n]otes buffer" })

--
-- NOTE: *** Lua Keymaps ***

vim.keymap.set("n", "<space>cs", ":source %<CR>", { desc = "[S]ource current file" })
vim.keymap.set("n", "<space>cx", ":.lua<CR>", { desc = "E[x]ecute current line in Lua" })
vim.keymap.set("v", "<space>cx", ":lua<CR>", { desc = "E[x]ecute selection in Lua" })
