return {
  'iamcco/markdown-preview.nvim',
  build = 'cd app && npm install', -- one-time only
  ft = 'markdown',
  config = function()
    vim.g.mkdp_auto_start = 0 -- don't open automatically
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_refresh_slow = 0
    vim.g.mkdp_theme = 'dark' -- or "light"
  end,
}
