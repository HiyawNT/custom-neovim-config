return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {
    check_ts = true, -- works with treesitter (good for JSX, etc.)
    disable_filetype = { 'TelescopePrompt', 'guihua', 'guihua_rust', 'clap_input' },
    fast_wrap = {}, -- enables <M-e> fast wrapping (super useful)

    -- THIS IS THE IMPORTANT PART – disable all auto-closing
    enable_check_bracket_line = false, -- don't insert ) if next char is )
    ignored_next_char = '[%w%.]', -- don't insert if next char is word or .

    -- Completely turn off auto-pairing for these pairs
    map_cr = false, -- don't add newline + indent on Enter inside ()
    map_bs = true, -- backspace works normally
    enable_moveright = true,
    disable_in_macro = false,
    map_c_h = false,
    map_c_w = false,

    -- THE KEY LINE: disable every single auto-pair
    pairs = {
      -- just leave the table empty or disable the ones you hate
      -- (you can keep some if you want, e.g. only disable ( [ { )
    },
    -- Instead, use the built-in "no auto pair" preset:
    active = false, -- THIS IS THE NUCLEAR OPTION – turns off ALL autopairs
  },
  config = function(_, opts)
    local npairs = require 'nvim-autopairs'
    npairs.setup(opts)

    -- If you still want fast-wrap (<M-e> / Alt-e) but ZERO auto-closing:
    if opts.active == false then
      -- re-enable only the fast-wrap feature
      local Rule = require 'nvim-autopairs.rule'
      local cond = require 'nvim-autopairs.conds'
      npairs.add_rules {
        Rule(' ', ' '):with_pair(function()
          return false
        end), -- dummy rule to enable fast_wrap
      }
    end
  end,
}
