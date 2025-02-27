-- move the cursor based on physical lines, not the actual lines.
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- go to start or end of line easier
vim.keymap.set({ "n", "x" }, "H", "^")
vim.keymap.set({ "n", "x" }, "L", "g_")

-- better
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<esc>", ":nohlsearch<cr>", { silent = true })

-- keep matches center screen when cycling with n|n
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "prev search result" })

-- move lines
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

--quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<cr>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<cr>")

-- keep visual selection when indenting
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "<", "<gv")

-- buffers
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "prev buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<cr>", { desc = "delete buffer" })

-- delete/change/replace without yanking.
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "replace without yanking" })
vim.keymap.set("n", "<leader>d", '"_d', { desc = "delete without yanking" })
vim.keymap.set("n", "<leader>D", '"_D', { desc = "delete until eol without yanking" })
vim.keymap.set("n", "<leader>c", '"_c', { desc = "change without yanking" })
vim.keymap.set("n", "<leader>C", '"_C', { desc = "change until eol without yanking" })

-- using the os clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "yank to clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "paste after cursor from clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "paste before cursor from clipboard" })
