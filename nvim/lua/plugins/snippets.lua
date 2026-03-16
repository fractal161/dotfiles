return {
    "SirVer/ultisnips",
    config = function ()
        vim.g.UltiSnipsExpandTrigger = "<S-tab>"
        vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
        vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
        vim.g.UltiSnipsExpandTrigger = "<S-tab>"
        vim.g.UltiSnipsSnippetDirectories= {
            vim.env.HOME .. "/.config/nvim/UltiSnips"
        }
    end,
    enabled = true,
}
