return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false, -- load immediately on startup
    priority = 1000, -- high priority so it loads first
    config = function()
      vim.g.catppuccin_flavour = 'mocha' -- latte, frappe, macchiato, mocha
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
