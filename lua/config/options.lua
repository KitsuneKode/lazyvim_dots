-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Options are automatically loaded before lazy.nvim startup
-- Add any additional options
--
-- vim.opt.winbar = "%=%m %f"
vim.opt.backupcopy = "yes"
vim.g.omni_sql_no_default_maps = 1
vim.g.lazyvim_prettier_needs_config = true

vim.o.exrc = true
vim.o.secure = true

vim.opt.cursorline = false

vim.opt.pumblend = 0
vim.opt.winblend = 0

vim.g.lazyvim_python_lsp = "basedpyright"

vim.opt.scrolloff = 8
