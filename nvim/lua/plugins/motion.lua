return {
    {
        "ggandor/leap.nvim",
        lazy = false, -- see https://github.com/ggandor/leap.nvim/issues/191
        config = function ()
            -- require("leap").create_default_mappings()
            vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
        end,
        enabled = true,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        -- TODO: setup
        enabled = false,
    },
}
