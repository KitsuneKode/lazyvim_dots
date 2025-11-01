-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options
--
-- vim.opt.winbar = "%=%m %f"
vim.opt.backupcopy = "yes"
vim.g.lazyvim_prettier_needs_config = false
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

-- local options = {
--
--   base46 = {
--     theme = "catpuccin-mocha", -- default theme
--     hl_add = {},
--     hl_override = {},
--     integrations = {},
--     changed_themes = {},
--     transparency = false,
--     theme_toggle = { "catpuccin-mocha", "catpuccin" },
--   },
--
--   ui = {
--     cmp = {
--       icons_left = false, -- only for non-atom styles!
--       style = "default", -- default/flat_light/flat_dark/atom/atom_colored
--       abbr_maxwidth = 60,
--       -- for tailwind, css lsp etc
--       format_colors = { lsp = true, icon = "󱓻" },
--     },
--
--     telescope = { style = "borderless" }, -- borderless / bordered
--
--     statusline = {
--       enabled = true,
--       theme = "default", -- default/vscode/vscode_colored/minimal
--       -- default/round/block/arrow separators work only for default statusline theme
--       -- round and block will work for minimal theme only
--       separator_style = "default",
--       order = nil,
--       modules = nil,
--     },
--
--     -- lazyload it when there are 1+ buffers
--     tabufline = {
--       enabled = false,
--       lazyload = true,
--       order = { "treeOffset", "buffers", "tabs", "btns" },
--       modules = nil,
--       bufwidth = 21,
--     },
--   },
--
--   nvdash = {
--     load_on_startup = false,
--     header = {
--       "                      ",
--       "  ▄▄         ▄ ▄▄▄▄▄▄▄",
--       "▄▀███▄     ▄██ █████▀ ",
--       "██▄▀███▄   ███        ",
--       "███  ▀███▄ ███        ",
--       "███    ▀██ ███        ",
--       "███      ▀ ███        ",
--       "▀██ █████▄▀█▀▄██████▄ ",
--       "  ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀",
--       "                      ",
--       "  Powered By  eovim ",
--       "                      ",
--     },
--
--     buttons = {
--       { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
--       { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
--       { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
--       { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
--       { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
--
--       { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
--
--       {
--         txt = function()
--           local stats = require("lazy").stats()
--           local ms = math.floor(stats.startuptime) .. " ms"
--           return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
--         end,
--         hl = "NvDashFooter",
--         no_gap = true,
--         content = "fit",
--       },
--
--       { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
--     },
--   },
--
--   term = {
--     startinsert = true,
--     base46_colors = true,
--     winopts = { number = false, relativenumber = false },
--     sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
--     float = {
--       relative = "editor",
--       row = 0.3,
--       col = 0.25,
--       width = 0.5,
--       height = 0.4,
--       border = "single",
--     },
--   },
--
--   lsp = { signature = true },
--
--   cheatsheet = {
--     theme = "grid", -- simple/grid
--     excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
--   },
--
--   mason = { pkgs = {}, skip = {} },
--
--   colorify = {
--     enabled = true,
--     mode = "virtual", -- fg, bg, virtual
--     virt_text = "󱓻 ",
--     highlight = { hex = true, lspvars = true },
--   },
-- }
--
-- local status, chadrc = pcall(require, "chadrc")
-- vim.tbl_deep_extend("force", options, status and chadrc or {})
