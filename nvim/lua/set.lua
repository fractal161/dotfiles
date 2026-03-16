-- defaults that i like
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 4
vim.opt.linebreak = true
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.smoothscroll = false
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = "tab:| ,trail:·,nbsp:+,lead:·"
vim.opt.tags = "./.tags;,.tags"

vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = true

-- Vimtex
vim.g.vimtex_compiler_latexmk = {
    out_dir = "./build",
}
vim.g.vimtex_view_general_viewer = "evince"

-- Python
vim.g.python3_host_prog = "/home/justin/.asdf/installs/python/3.12.3/bin/python3"
