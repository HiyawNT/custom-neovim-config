return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    -- or change to this
    -- dashboard.section.header.val = {
    --   [[  ███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ]],
    --   [[  ████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ]],
    --   [[  ██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ]],
    --   [[  ██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ]],
    --   [[  ██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ]],
    --   [[  ╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ]],
    -- }

    dashboard.section.header.val = {
      -- [[  ▀███▄   ▀███▀███▀▀▀███  ▄▄█▀▀██▄ ▀████▀   ▀███▀████▀████▄     ▄███▀ ]],
      -- [[    ███▄    █   ██    ▀█▄██▀    ▀██▄ ▀██     ▄█   ██   ████    ████   ]],
      -- [[    █ ███   █   ██   █  ██▀      ▀██  ██▄   ▄█    ██   █ ██   ▄█ ██   ]],
      -- [[    █  ▀██▄ █   ██████  ██        ██   ██▄  █▀    ██   █  ██  █▀ ██   ]],
      -- [[    █   ▀██▄█   ██   █  ▄█▄      ▄██   ▀██ █▀     ██   █  ██▄█▀  ██   ]],
      -- [[    █     ███   ██     ▄███▄    ▄██▀    ▄██▄      ██   █  ▀██▀   ██   ]],
      -- [[  ▄███▄    ██ ▄██████████ ▀▀████▀▀       ██     ▄████▄███▄ ▀▀  ▄████▄ ]],
    
 [[ ██████╗ ██╗   ██╗██╗██╗     ██████╗     ██╗   ██╗ ██████╗ ██╗   ██╗██████╗     ██╗    ██╗ ██████╗ ██████╗ ██╗     ██████╗  ]], 
 [[ ██╔══██╗██║   ██║██║██║     ██╔══██╗    ╚██╗ ██╔╝██╔═══██╗██║   ██║██╔══██╗    ██║    ██║██╔═══██╗██╔══██╗██║     ██╔══██╗ ]],
 [[ ██████╔╝██║   ██║██║██║     ██║  ██║     ╚████╔╝ ██║   ██║██║   ██║██████╔╝    ██║ █╗ ██║██║   ██║██████╔╝██║     ██║  ██║ ]],
 [[ ██╔══██╗██║   ██║██║██║     ██║  ██║      ╚██╔╝  ██║   ██║██║   ██║██╔══██╗    ██║███╗██║██║   ██║██╔══██╗██║     ██║  ██║ ]],
 [[ ██████╔╝╚██████╔╝██║███████╗██████╔╝       ██║   ╚██████╔╝╚██████╔╝██║  ██║    ╚███╔███╔╝╚██████╔╝██║  ██║███████╗██████╔╝ ]],
 [[ ╚═════╝  ╚═════╝ ╚═╝╚══════╝╚═════╝        ╚═╝    ╚═════╝  ╚═════╝ ╚═╝  ╚═╝     ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝  ]],
}
    dashboard.section.buttons.val = {
      dashboard.button('f', '  Find File', ':Telescope find_files <CR>'),
      dashboard.button('e', '  New File', ':ene <BAR> startinsert <CR>'),
      dashboard.button('r', '  Recent', ':Telescope oldfiles <CR>'),
      dashboard.button('s', '  Settings', ':e $MYVIMRC <CR>'),
      dashboard.button('q', '  Quit', ':qa<CR>'),
    }
    dashboard.section.footer.val = {
      '',
      '',
      '',
      '',
      '                                                             by hiyaw',
    }
    dashboard.section.footer.opts = { hl = 'Comment', position = 'center' }

    -- Footer will now show up perfectly aligned to the right
    alpha.setup(dashboard.opts)
    alpha.setup(dashboard.opts)
  end,
}
