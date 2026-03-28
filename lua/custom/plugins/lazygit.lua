return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Open LazyGit' },
  },
  config = function()
    -- Optional: make LazyGit use floating window nicely
    require('lazygit').setup {
      -- you can add more config here if needed
    }
  end,
}
