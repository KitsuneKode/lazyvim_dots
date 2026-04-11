vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode", silent = true })

vim.keymap.set("n", "<C-d>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-d>zz", true, false, true), "nx", false)
end, { desc = "Scroll down and center" })

vim.keymap.set("n", "<C-u>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-u>zz", true, false, true), "nx", false)
end, { desc = "Scroll up and center" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })
vim.keymap.set({ "v", "n" }, "<leader>P", "_dP", { desc = "Paste without replacing register" })
