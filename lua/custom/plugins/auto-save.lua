-- Autocmd group for auto-save notifications
local group = vim.api.nvim_create_augroup('autosave', {})

vim.api.nvim_create_autocmd('User', {
  pattern = 'AutoSaveWritePost',
  group = group,
  callback = function(opts)
    if opts.data.saved_buffer ~= nil then
      local message = 'AutoSave: saved at ' .. vim.fn.strftime '%H:%M:%S'
      vim.notify(message, vim.log.levels.INFO)
      -- Optional: Dim the message color and auto-clean it after 1250ms (mimicking your old config)
      vim.cmd 'hi! link NotifyLog Normal' -- Adjust highlighting for dimming if needed
      vim.defer_fn(function()
        vim.cmd 'redraw'
      end, 1250)
    end
  end,
})

return {
  {
    'okuuva/auto-save.nvim',
    cmd = 'ASToggle',
    event = { 'InsertLeave', 'TextChanged' },
    opts = {
      --
      -- All of these are just the defaults
      --
      enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
      trigger_events = { -- See :h events
        immediate_save = { 'BufLeave', 'FocusLost' }, -- vim events that trigger an immediate save
        defer_save = { 'InsertLeave', 'TextChanged' }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
        cancel_deferred_save = { 'InsertEnter' }, -- vim events that cancel a pending deferred save
      },
      -- function that takes the buffer handle and determines whether to save the current buffer or not
      -- return true: if buffer is ok to be saved
      -- return false: if it's not ok to be saved
      -- if set to `nil` then no specific condition is applied
      condition = nil,
      write_all_buffers = false, -- write all buffers when the current one meets `condition`
      -- Do not execute autocmds when saving
      noautocmd = false,
      lockmarks = false,
      -- delay after which a pending save is executed (default 1000)
      debounce_delay = 1000,
      debug = false,
    },
  },
}
