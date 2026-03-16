return {
    "lervag/vimtex",
    lazy = false,
    init = function ()
        vim.g.vimtex_view_general_viewer = "evince"
        vim.g.vimtex_compiler_latexmk = {
            out_dir = "./build",
        }
    end
}
