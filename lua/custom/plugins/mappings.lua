-- lua/custom/mappings.lua
-- 1. jk escape
-- 2. Paste without yanking replaced text
-- 3. Pro save/quit shortcuts
-- 4. Terminal shortcuts (float / horizontal / vertical + Esc to exit)
-- 5. <leader>y → select whole file
-- 6. <leader>d → delete whole file without yanking

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ──────────────────────
-- 1. jk → <Esc>
-- ──────────────────────
map('i', 'jk', '<Esc>', { desc = 'Exit insert mode with jk' })

-- ──────────────────────
-- 2. Paste WITHOUT yanking replaced text
-- ──────────────────────
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*:*',
  callback = function()
    map('x', 'p', '"_dP', opts)
    map('x', 'P', '"_dP', opts)
  end,
})
map('x', 'p', '"_dP', opts)
map('x', 'P', '"_dP', opts)
-- ──────────────────────
-- Uppercase S / C / D → do NOT yank (black-hole register)
-- ──────────────────────
map('n', 'S', '"_S', { desc = 'S  (change line) → no yank' })
map('n', 'C', '"_C', { desc = 'C  (change to EOL) → no yank' })
map('n', 'D', '"_D', { desc = 'D  (delete to EOL) → no yank' })

-- Optional: also cover the very rare visual-mode uppercase versions
map('x', 'S', '"_S', { desc = 'Visual S → no yank' })
map('x', 'C', '"_C', { desc = 'Visual C → no yank' })
map('x', 'D', '"_D', { desc = 'Visual D → no yank' })
--
-- ──────────────────────
-- 3. Pro save & quit
-- ──────────────────────
map('n', '<leader>w', ':w<CR>', { desc = 'Save buffer' })

map({ 'n', 'i' }, '<C-s>', function()
  local saved = 0
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, 'modified') then
      vim.api.nvim_buf_call(buf, function()
        vim.cmd 'silent! write'
      end)
      saved = saved + 1
    end
  end
  if saved > 0 then
    print('Saved ' .. saved .. ' buffer(s)')
  end
end, { desc = 'Save all modified' })

map('n', '<leader>q', ':q<CR>', { desc = 'Quit window' })
map('n', '<leader>qq', function()
  local dirty = vim.tbl_filter(function(b)
    return vim.bo[b].modified
  end, vim.api.nvim_list_bufs())
  vim.cmd(#dirty > 0 and 'qa!' or 'qa')
end, { desc = 'Quit all (force if dirty)' })

map('n', '<leader>wq', ':wq<CR>', { desc = 'Write and quit window' })
map('n', '<leader>WQ', ':wq!<CR>', { desc = 'Write and quit window (force)' })
map('n', '<leader>wa', function()
  vim.cmd 'silent! wall'
  vim.cmd 'qa'
end, { desc = 'Write all and quit Neovim' })

-- ──────────────────────
-- 4. Terminal shortcuts
-- ──────────────────────
map('n', '<leader>tt', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Toggle Float Terminal' })
map('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Toggle Horizontal Terminal' })
map('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', { desc = 'Toggle Vertical Terminal' })
map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- ──────────────────────
-- 5. <leader>y → select entire file
-- ──────────────────────
map('n', '<leader>y', 'ggVG', { desc = 'Select whole file' })

-- ──────────────────────
-- 6. <leader>d → delete everything without yanking
-- ──────────────────────
map('n', '<leader>d', 'gg"_dG', { desc = 'Delete whole file (no yank)' })
-- ──────────────────────
-- Close current buffer (smart, keeps window)
-- ──────────────────────
-- <leader>c  → close buffer, keep window/layout
-- <leader>bd → same thing (bd = buffer delete, very common)
-- <leader>bc → force close even if modified
map('n', '<leader>c', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, 'modified')

  if modified then
    local choice = vim.fn.confirm('Buffer has unsaved changes. Save before closing?', '&Yes\n&No\n&Cancel', 3)
    if choice == 1 then -- Yes
      vim.cmd 'write'
    elseif choice == 3 then -- Cancel
      return
    end
    -- If No or after save, proceed to delete
  end

  -- Try to switch to another buffer first to avoid errors
  local bufs = vim.fn.getbufinfo { buflisted = 1 }
  local other_bufs = vim.tbl_filter(function(b)
    return b.bufnr ~= bufnr
  end, bufs)

  if #other_bufs > 0 then
    vim.cmd 'bnext'
  else
    vim.cmd 'enew' -- no other listed buffers → open empty one
  end

  -- Now safely delete the original buffer
  vim.cmd('silent! bdelete! ' .. bufnr)
  print 'Buffer closed'
end, { desc = 'Close current buffer (smart)' })

-- Simple aliases
map('n', '<leader>bd', '<leader>c', { desc = 'Close buffer (bd alias)' })

-- Force close even if modified (no questions asked)
map('n', '<leader>bc', function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.cmd('bdelete! ' .. bufnr)
end, { desc = 'Force close buffer (no save prompt)' })
return {}
