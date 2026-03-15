-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps

-- Scroll half page down and center
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down and center", remap = false, silent = true })
vim.keymap.set("n", "<C-d>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-d>zz", true, false, true), "nx", false)
end, { desc = "Scroll down + center" })

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode", remap = false, silent = true })

-- Scroll half page up and center
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up and center", remap = false, silent = true })
vim.keymap.set("n", "<C-u>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-u>zz", true, false, true), "nx", false)
end, { desc = "Scroll up + center" })

-- Next search result and center
vim.keymap.set("n", "n", "nzzzv", { desc = "Next and center", remap = false })

-- Previous search result and center
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous and center", remap = false })

-- Paste after select without losing clipboard content
vim.keymap.set({ "v", "n" }, "<leader>P", "_dP", { desc = "Paste after select paste", remap = false })
