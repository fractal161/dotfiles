return {
    {
        'tpope/vim-sleuth',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    insert          = '<C-g>z',
                    insert_line     = 'gC-ggZ',
                    normal          = 'gz',
                    normal_cur      = 'gZ',
                    normal_line     = 'gzz',
                    normal_cur_line = 'gZZ',
                    visual          = 'gz',
                    visual_line     = 'gZ',
                    delete          = 'gzd',
                    change          = 'gzc',
                }
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
