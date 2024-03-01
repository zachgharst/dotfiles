local neotest = require('neotest')

neotest.setup({
  adapters = {
    require('neotest-dotnet')
  },
  -- i'm not a huge fan of these icons, but i don't like the defaults either
  -- maybe try just letters some day
  icons = {
    failed = "❌",
    passed = "✅",
    running = "😥",
    skipped = "⏭️",
    unknown = "❔",
    watching = "👀",
  },
})

vim.keymap.set('n', '<leader>tt', function() neotest.run.run() end)
vim.keymap.set('n', '<leader>tf', function() neotest.run.run(vim.fn.expand("%")) end)
vim.keymap.set('n', '<leader>ts', function() neotest.summary.toggle() end)
