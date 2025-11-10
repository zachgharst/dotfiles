local harpoon = require("harpoon")
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>a", function() harpoon:list():add() end, desc = "Harpoon: Add File" },
    { "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon: Toggle Quick Menu" },
    { "<C-h>", function() harpoon:list():select(1) end, desc = "Harpoon: Navigate to File 1" },
    { "<C-j>", function() harpoon:list():select(2) end, desc = "Harpoon: Navigate to File 2" },
    { "<C-k>", function() harpoon:list():select(3) end, desc = "Harpoon: Navigate to File 3" },
    { "<C-l>", function() harpoon:list():select(4) end, desc = "Harpoon: Navigate to File 4" },
  },
}
