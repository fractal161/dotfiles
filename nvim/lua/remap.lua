-- better pasting
vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set('v', 'P', '"_dp')
-- swap smooth scroll
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "gj", "j")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "gk", "k")
-- esc to clear highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr><Esc>")
-- spell check
vim.keymap.set("n", "<leader>sc", "<cmd>setlocal spell! spell? spelllang=en_us<cr>")
-- vim.keymap.set("n", "gd", "<C-]>")
-- TODO: some way to yank into the clipboard
vim.keymap.set("n", "gd", function ()
    if vim.fn.tagfiles()[1] ~= nil then
        -- use ctrl+]
        return "<C-]>"
    else
        -- use original gd
        return "gd"
    end
end, { expr = true })

vim.keymap.set("ca", "W", "w")
vim.keymap.set("ca", "WQ", "wq")
vim.keymap.set("ca", "Wq", "wq")
vim.keymap.set("ca", "Q", "q")
vim.keymap.set("ca", "Qa", "qa")

-- autocommands
vim.api.nvim_create_autocmd({ "BufRead", "BufWritePost" }, {
  pattern = {"*.txt", "*.md"},
  command = "setlocal spell spelllang=en_us",
})

-- explicit leader
vim.g.mapleader = '\\'
