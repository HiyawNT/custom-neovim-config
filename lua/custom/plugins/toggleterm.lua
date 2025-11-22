return {
  'akinsho/toggleterm.nvim',
  version = '*',
  -- Load immediately on startup
  event = 'VeryLazy',
  config = function()
    require('toggleterm').setup {
      size = 15,
      open_mapping = [[<c-t>]], -- CHANGE: Use <C-t> instead (reliable)
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell, -- uses your zsh
      float_opts = {
        border = 'curved',
        width = function()
          return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.8)
        end,
      },
    }

    -- Optional: Keep old <C-\> if your terminal supports it
    vim.keymap.set('n', '<C-\\>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })
  end,
}
