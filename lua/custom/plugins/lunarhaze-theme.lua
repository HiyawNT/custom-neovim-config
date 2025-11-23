return {
  'NvChad/nvim-colorizer.lua', -- just for the theme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'catppuccin',
          section_separators = { left = '', right = '' },
          component_separators = '',
          globalstatus = true,
        },
        sections = {
          lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { { 'filename', path = 1 } }, -- shows relative path
          lualine_x = {},
          lualine_y = { 'progress', 'location' },
          lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
        },
      }
    end,
  },
}
