-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- lua/plugins/neo-tree.lua  (or wherever you keep it)
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<CR>', desc = 'NeoTree: Toggle file explorer' },
    { '<leader>o', '<cmd>Neotree reveal<CR>', desc = 'NeoTree: Reveal current file' },
  },
  opts = {
    close_if_last_window = true, -- close Neo-tree if it's the last window
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
      follow_current_file = { enabled = true }, -- auto-reveal current file
      hijack_netrw_behavior = 'open_current',
      use_libuv_file_watcher = true,
      window = {
        mappings = {
          ['<leader>e'] = 'close_window',
          ['h'] = 'toggle_hidden',
          ['H'] = 'toggle_node',
          ['l'] = 'open',
          ['<CR>'] = 'open',
          ['o'] = 'open',
        },
      },
    },
  },
}
