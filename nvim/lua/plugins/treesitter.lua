return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function ()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "html", "gotmpl" },
                highlight = {
                    enable = true,
                    -- disable = { "vimdoc" },
                },
                indent = {
                    enable = true,
                },
            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            min_window_height = 20,
            mode = "cursor",
            max_lines = 2,
        },
        enabled = false,
    },
}
