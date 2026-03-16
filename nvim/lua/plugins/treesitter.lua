return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function ()
            local parser_config = require("nvim-treesitter.parsers")
                .get_parser_configs()
            parser_config.gotmpl = {
                install_info = {
                    url = "https://github.com/ngalaiko/tree-sitter-go-template",
                    files = { "src/parser.c" },
                },
                filetype = "gotmpl",
                used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl" },
            }
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "html" },
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
