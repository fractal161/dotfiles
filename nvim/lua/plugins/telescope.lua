return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = "*",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
        "nvim-telescope/telescope-project.nvim",
    },
    keys = {
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
        { "<leader>fp", "<cmd>Telescope project<cr>" },
    },
    config = function ()
        local telescope = require("telescope")
        telescope.setup{}
        telescope.load_extension("fzy_native")
        telescope.load_extension("project")
    end
}
