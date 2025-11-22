return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  cmd = 'Neogit',
  opts = {
    kind = 'auto', -- Uses floating windows or splits.
  },
  keys = {
    { '<leader>gg', '<cmd>Neogit kind=tab<cr>', desc = 'Neogit status' },
    { '<leader>gc', '<cmd>Neogit commit<cr>', desc = 'Commit popup' },
    { '<leader>gp', '<cmd>Neogit push<cr>', desc = 'Push' },
    { '<leader>gl', '<cmd>Neogit log<cr>', desc = 'Log graph' },
    { '<leader>gb', '<cmd>Neogit branch<cr>', desc = 'Branch popup' },
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Diffview all changes' },
  },
}
