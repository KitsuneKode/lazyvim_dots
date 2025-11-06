-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps

-- Scroll half page down and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down and center", remap = false })

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode", remap = false })

-- Scroll half page up and center
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up and center", remap = false })

-- Next search result and center
vim.keymap.set("n", "n", "nzzzv", { desc = "Next and center", remap = false })

-- Previous search result and center
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous and center", remap = false })

-- Paste after select without losing clipboard content
vim.keymap.set("v", "<leader>P", "_dP", { desc = "Paste after select paste", remap = false })
