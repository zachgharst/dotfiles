return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
    local rose_pine = require("rose-pine")
    rose_pine.setup({
      styles = {
        -- todo: set this to true and change what I want to be italic
        italic = false,
        transparency = true,
      },
    })

	  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

    vim.cmd("colorscheme rose-pine")
	end,
}
