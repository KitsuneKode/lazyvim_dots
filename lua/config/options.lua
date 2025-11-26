-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Options are automatically loaded before lazy.nvim startup
-- Add any additional options
--
-- vim.opt.winbar = "%=%m %f"
vim.opt.backupcopy = "yes"

vim.g.lazyvim_prettier_needs_config = true

vim.keymap.set({ "n" }, "<C-k>", function()
  require("lsp_signature").toggle_float_win()
end, { desc = "Toggle Signature Help" })
vim.keymap.set({ "n" }, "<Leader>fz", function()
  require("fzf-lua").lgrep_curbuf()
end, { desc = "Find words in current buffer" })
vim.keymap.set("n", "<leader>ge", ":Neotree toggle git_status<CR>", { desc = "Toggle Git Status" })
vim.keymap.set("n", "<leader>be", ":Neotree toggle buffers<CR>", { desc = "Toggle Buffers" })

vim.o.exrc = true
vim.o.secure = true

vim.opt.cursorline = false

vim.opt.pumblend = 0
vim.opt.winblend = 0
