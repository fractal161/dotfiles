return {
    { -- default theme
        "nanotech/jellybeans.vim",
        lazy = false,
        priority = 1000,
        config = function ()
            vim.cmd("colorscheme jellybeans")
        end,
    },
    { -- only highlight active function
        "folke/twilight.nvim",
        config = function ()
            -- vim.cmd("TwilightEnable")
        end
        -- TODO: check https://github.com/folke/twilight.nvim/issues/28
    }
}
