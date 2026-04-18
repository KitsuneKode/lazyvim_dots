local in_ksb = vim.env.KITTY_SCROLLBACK_NVIM == 'true'


return {
  -- Disable session restore inside kitty-scrollback (it would load your editor session, trashing the UI)
  { 'folke/persistence.nvim', cond = not in_ksb },

  -- Hide bufferline tab bar inside kitty-scrollback
  { 'akinsho/bufferline.nvim', cond = not in_ksb },

  -- Disable Discord presence inside kitty-scrollback
  { 'andweeb/presence.nvim', cond = not in_ksb },

  {
    'mikesmithgh/kitty-scrollback.nvim',
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
    event = { 'User KittyScrollbackLaunch' },
    config = function()
      require('kitty-scrollback').setup({
        -- Global config applied to all modes
        {
          status_window = {
            enabled = true,
            autoclose = true,   -- hide status badge once ready
            show_timer = true,
          },
          paste_window = {
            highlight_as_normal_win = true,  -- paste window looks like a normal buffer
            hide_footer = false,             -- show keybind hints at bottom
            winblend = 0,
          },
          kitty_get_text = {
            ansi = true,
            extent = 'all',
            clear_selection = true,
          },
        },
        -- Search mode: open scrollback and immediately enter backward search
        search = {
          callbacks = {
            after_ready = function()
              vim.api.nvim_feedkeys('?', 'n', false)
            end,
          },
        },
      })
    end,
  },
}
