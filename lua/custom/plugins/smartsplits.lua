return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    require('smart-splits').setup {}

    -- movement
    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)

    -- resizing
    vim.keymap.set('n', '<C-A-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<C-A-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<C-A-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<C-A-l>', require('smart-splits').resize_right)
  end,
}
