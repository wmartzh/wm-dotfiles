-- Harpoon
--
local harpoon = require("harpoon")

require("telescope").load_extension("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
	vim.notify("󱡀 Harpoon: Added ", vim.log.levels.INFO)
end)
vim.keymap.set("n", "<C-e>", function()
	-- harpoon.ui:toggle_quick_menu(harpoon:list())
	require("telescope").extensions.harpoon.marks()
end)

vim.keymap.set("n", "<C-d>", function()
	harpoon:list():remove()
	vim.notify("󱡀 Harpoon: Removed ", vim.log.levels.ERROR)
end)

vim.keymap.set("n", "<leader>hc", function()
	require("harpoon"):list():clear()
	vim.notify("󱡀 Harpoon: All marks cleared ", vim.log.levels.ERROR)
end, { desc = "Harpoon: Clear all marks" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end)
