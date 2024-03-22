local neotest = require('neotest')

neotest.setup({
  adapters = {
    require('neotest-dotnet')
  },
})

vim.keymap.set('n', '<leader>tt', function() neotest.run.run() end)
vim.keymap.set('n', '<leader>tf', function() neotest.run.run(vim.fn.expand("%")) end)
vim.keymap.set('n', '<leader>ts', function() neotest.summary.toggle() end)
