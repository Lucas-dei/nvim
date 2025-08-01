return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
    'snacks.nvim',
    'Saghen/blink.cmp',
    -- see above for full list of optional dependencies ☝️
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    workspaces = {
      {
        name = 'My Vault',
        path = '~/Documents/My Vault/',
      },
    },
    -- see below for full list of options 👇
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },
  },
  config = function(_, opts)
    require('obsidian').setup(opts)

    -- Keymaps are only created when the plugin loads
    -- Normal mode keymaps
    vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = 'Open in Obsidian app' })
    vim.keymap.set('n', '<leader>oq', '<cmd>ObsidianQuickSwitch<CR>', { desc = 'Quick switch note' })
    vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = 'Create new note' })
    vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianToday<CR>', { desc = "Today's daily note" })
    vim.keymap.set('n', '<leader>oy', '<cmd>ObsidianYesterday<CR>', { desc = "Yesterday's daily note" })
    vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = 'Show backlinks' })
    vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = 'Search vault' })
    vim.keymap.set('n', '<leader>ol', '<cmd>ObsidianLink<CR>', { desc = 'Link visual text to note' })
    vim.keymap.set('n', '<leader>of', '<cmd>ObsidianFollowLink<CR>', { desc = 'Follow link under cursor' })
    vim.keymap.set('n', '<leader>ow', '<cmd>ObsidianWorkspace<CR>', { desc = 'Switch workspace' })
    vim.keymap.set('n', '<leader>od', '<cmd>ObsidianDailies<CR>', { desc = 'Browse daily notes' })
    vim.keymap.set('n', '<leader>otc', '<cmd>ObsidianTOC<CR>', { desc = 'Table of contents' })

    -- Visual mode keymaps
    vim.keymap.set('v', '<leader>ox', ':ObsidianExtractNote<CR>', { desc = 'Extract selection to new note' })
    vim.keymap.set('v', '<leader>ol', ':ObsidianLink<CR>', { desc = 'Link visual text' })
    vim.keymap.set('v', '<leader>on', ':ObsidianLinkNew<CR>', { desc = 'Create and link new note from selection' })
  end,
}
