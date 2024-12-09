vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>rp", [["+p]])

vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>")
vim.keymap.set("n", "<leader>cp", "<cmd>cp<CR>zz")
vim.keymap.set("n", "<leader>cn", "<cmd>cn<CR>zz")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>dot", "<cmd>e $DOTFILES<CR>");
vim.keymap.set("n", "<leader>vpp", "<cmd>e $DOTFILES/nvim/lua/zachgharst/packer.lua<CR>");
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

vim.keymap.set("n", "<leader>dt", "a<C-R>=system('date +%s')[0:-2]<CR><Esc>")
vim.keymap.set("n", "<leader>guid", "a<C-R>=system('uuidgen')[0:-2]<CR><Esc>")
