-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = "plugins"
})

-- WISHLIST

-- GIT
-- diffview.nvim

-- VIMTEX
-- vimtex

-- MOTION
-- harpoon/equivalent

-- MISC
-- trouble.nvim
-- nvim-devdocs
-- nvim-bqf??
-- some code runner (https://github.com/rockerBOO/awesome-neovim?tab=readme-ov-file#code-runner)
-- formatter.nvim (later)
