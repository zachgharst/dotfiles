return {
  "ziontee113/icon-picker.nvim",
  config = function()
    require("icon-picker").setup({ disable_legacy_commands = true })

    vim.keymap.set("n", "<Leader>m", "<CMD>IconPickerNormal<CR>")
    vim.keymap.set("i", "<C-j>", "<CMD>IconPickerInsert<CR>")
  end,
}
