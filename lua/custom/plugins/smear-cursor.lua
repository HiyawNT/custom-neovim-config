return {
  'sphamba/smear-cursor.nvim',
  opts = {
    -- You can customize here (these are nice defaults)
    smear_between_buffers = true,
    smear_between_windows = true,
    use_floating_windows = true,
    scroll_buffer_window = true,

    -- Speed and feel
    stiffness = 0.9, -- 0.6 ~ 0.9 feels good
    trailing_stiffness = 0.7,
    distance_stop_animating = 0.5,
    hide_target_hack = true, -- recommended
  },
}
