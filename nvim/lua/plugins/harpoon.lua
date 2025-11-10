local harpoon = require("harpoon")
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
  keys = {
    { "<leader>a", function() harpoon:list():add() end, desc = "Harpoon: Add File" },
    -- { "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon: Toggle Quick Menu" },
    { "<C-e>", function() toggle_telescope(harpoon:list()) end, desc = "Harpoon: Toggle Quick Menu" },
    { "<C-h>", function() harpoon:list():select(1) end, desc = "Harpoon: Navigate to File 1" },
    { "<C-j>", function() harpoon:list():select(2) end, desc = "Harpoon: Navigate to File 2" },
    { "<C-k>", function() harpoon:list():select(3) end, desc = "Harpoon: Navigate to File 3" },
    { "<C-l>", function() harpoon:list():select(4) end, desc = "Harpoon: Navigate to File 4" },
  },
}
