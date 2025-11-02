-- bootstrap lazy.nvim, LazyVim and your plugins
-- put this in your main init.lua file ( before lazy setup )

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

require("config.lazy")
