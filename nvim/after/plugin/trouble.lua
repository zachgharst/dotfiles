local trouble = require('trouble')
trouble.setup({
  warn_no_results = false,
  open_no_results = true,
})

vim.keymap.set('n', '<leader>wx', "<cmd>Trouble<cr>")
vim.keymap.set('n', '<leader>ww', "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set('n', '<leader>wd', "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
vim.keymap.set('n', '<leader>ws', "<cmd>Trouble symbols toggle focus=false<cr>")
vim.keymap.set('n', '<leader>wr', "<cmd>Trouble loclist toggle<cr>")
vim.keymap.set('n', '<leader>wl', "<cmd>Trouble lsp toggle focus=false win.position=right<cr>")
vim.keymap.set('n', '<leader>wq', "<cmd>Trouble lsp toggle focus=false win.position=right<cr>")
