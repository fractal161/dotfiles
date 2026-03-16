return {
    {
        'tpope/vim-sleuth',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        init = function()
            vim.g.nvim_surround_no_mappings = true
        end,
        config = function()
            require("nvim-surround").setup({})
            vim.keymap.set("i", "<C-g>z", "<Plug>(nvim-surround-insert)", {
                desc = "Surround: add around cursor (insert)"
            })
            vim.keymap.set("i", "<C-g>Z", "<Plug>(nvim-surround-insert-line)", {
                desc = "Surround: add around cursor on new lines (insert)"
            })
            vim.keymap.set("n", "gz",  "<Plug>(nvim-surround-normal)", {
                desc = "Surround: add around motion"
            })
            vim.keymap.set("n", "gZ",  "<Plug>(nvim-surround-normal-cur)", {
                desc = "Surround: add around current line"
            })
            vim.keymap.set("n", "gzz", "<Plug>(nvim-surround-normal-line)", {
                desc = "Surround: add around motion on new lines"
            })
            vim.keymap.set("n", "gZZ", "<Plug>(nvim-surround-normal-cur-line)", {
                desc = "Surround: add around current line on new lines"
            })
            vim.keymap.set("x", "gz",  "<Plug>(nvim-surround-visual)", {
                desc = "Surround: add around visual selection"
            })
            vim.keymap.set("x", "gZ",  "<Plug>(nvim-surround-visual-line)", {
                desc = "Surround: add around visual selection on new lines"
            })
            vim.keymap.set("n", "gzd", "<Plug>(nvim-surround-delete)", {
                desc = "Surround: delete"
            })
            vim.keymap.set("n", "gzc", "<Plug>(nvim-surround-change)", {
                desc = "Surround: change"
            })
        end
    },
    { -- hides patterns, like secrets in env files
        "laytan/cloak.nvim",
        opts = {
            enabled = true,
            patterns = {
                {
                    file_pattern = ".env",
                    cloak_pattern = "=.+",
                }
            }
        },
    },
    { -- hex viewer utility
        "fidian/hexmode",
        lazy = true,
    },
    {
        "chipsenkbeil/distant.nvim",
        branch = "v0.3",
        lazy = true,
    },
    { -- TODO: consider  girishji/devdocs.vim
        "luckasRanarison/nvim-devdocs",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = true,
        opts = {},
        cmd = {
            "DevdocsFetch",
            "DevdocsInstall",
            "DevdocsUninstall",
            "DevdocsOpen",
            "DevdocsOpenFloat",
            "DevdocsOpenCurrent",
            "DevdocsOpenCurrentFloat",
            "DevdocsToggle",
            "DevdocsUpdate",
            "DevdocsUpdateAll",
        },
    },
    {
        "klen/nvim-config-local",
    },
    {
        "luk400/vim-jukit",
        -- config = function ()
        --     vim.g.jukit_mappings = 1
        -- end,
        event = "BufEnter *.ipynb",
        lazy = true,
        enabled = false,
    },
    {
        "benomahony/uv.nvim",
        lazy = true,
    },
}
