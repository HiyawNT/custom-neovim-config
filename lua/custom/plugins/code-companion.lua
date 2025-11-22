return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'hrsh7th/nvim-cmp',
  },
  event = { 'InsertEnter', 'CmdlineEnter' },
  cmd = { 'CodeCompanion', 'CodeCompanionChat', 'CodeCompanionActions' },

  config = function()
    require('codecompanion').setup {
      adapters = {
        http = {
          gemini = function()
            return require('codecompanion.adapters').extend('gemini', {
              env = { api_key = os.getenv 'GEMINI_API_KEY' },
              schema = {
                model = { default = 'gemini-2.0-flash-exp' },
              },
            })
          end,
        },
      },

      strategies = {
        chat = { adapter = 'gemini' },
        inline = { adapter = 'gemini' },
        agent = { adapter = 'gemini' },
      },

      display = {
        chat = { show_settings = true },
      },
    }
  end,
}
