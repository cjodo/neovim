-- Auto indent to correct spot in insert mode
vim.keymap.set('n', 'i', function()
  return string.match(vim.api.nvim_get_current_line(), '%g') == nil
      and 'cc' or 'i'
end, { expr = true, noremap = true })

-- Keeps cursor focused in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("v", "jk", "<Esc>")

vim.keymap.set("n", "OO", "o<Esc>k")

-- Netrw access
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<A-j>", function() vim.lsp.buf.format() vim.cmd("m .+1") end)
vim.keymap.set("n", "<A-k>", function() vim.lsp.buf.format() vim.cmd("m .-2") end)
vim.keymap.set("v", "<A-j>", function() vim.lsp.buf.format() vim.cmd("m '>+1|gv") end)
vim.keymap.set("v", "<A-k>", function() vim.lsp.buf.format() vim.cmd("m '<-2|gv") end)

vim.keymap.set('n', '<leader>ff', "<cmd>NvimTreeOpen<CR>", { desc="NvimTreeOpen" })
