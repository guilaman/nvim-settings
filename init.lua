require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
local map = vim.api.nvim_set_keymap
vim.wo.number = true
vim.wo.relativenumber = true
-- Map Control+Space to yank to clipboard
map('v', '<c-space>', '"+y', {noremap=true, silent=false})
