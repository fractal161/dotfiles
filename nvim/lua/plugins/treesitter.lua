return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "html", "gotmpl" },
            highlight = {
                enable = true,
                -- disable = { "vimdoc" },
            },
            indent = {
                enable = true,
            },
        },
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
