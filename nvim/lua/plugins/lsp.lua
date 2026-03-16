local servers = {
    "clangd",
    "eslint",
    "ts_ls",
    "gopls",
    "rust_analyzer",
    "html",
    "pyright",
    "lua_ls",
    "somesass_ls",
    "astro",
    "dafny",
    "tailwindcss"
}

local show_virtual_lines = function()
    vim.diagnostic.config({
        virtual_lines = { current_line = true },
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
        group = vim.api.nvim_create_augroup('line_diagnostics', {
            clear = true
        }),
        callback = function()
            vim.diagnostic.config({
                virtual_lines = false,
            })
            return true
        end
    })
end

local show_virtual_lines_jump = function(jump_count)
    -- prevent autocmd for repeated jumps
    pcall(vim.api.nvim_del_augroup_by_name, "line_diagnostics_jump")

    vim.diagnostic.jump { count = jump_count }
    vim.diagnostic.config {
        virtual_lines = { current_line = true },
    }
    vim.defer_fn(function() -- deferred to not trigger by jump itself
        vim.api.nvim_create_autocmd("CursorMoved", {
            desc = "User(once): Reset diagnostics virtual lines",
            once = true,
            group = vim.api.nvim_create_augroup("line_diagnostics_jump", {}),
            callback = function()
                vim.diagnostic.config {
                    virtual_lines = false,
                }
            end,
        })
    end, 1)
end

-- after the language server attaches to the current buffer
local default_mappings = function(client, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>d', show_virtual_lines, bufopts)
    vim.keymap.set('n', '[d', function()
        show_virtual_lines_jump(-1)
    end, bufopts)
    vim.keymap.set('n', ']d', function()
        show_virtual_lines_jump(1)
    end, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
    end, bufopts)
end

local setup_dafny = function()
    vim.diagnostic.config({
        underline = {
            severity = {
                vim.diagnostic.severity.ERROR,
                vim.diagnostic.severity.WARN,
            },
        },
    })
end


local config = function()
    require("mason").setup()
    vim.lsp.enable(servers)
    vim.diagnostic.config({
        virtual_text = true,
    })
    vim.opt.completeopt = {
        "fuzzy",
        "menu",
        "menuone",
        "popup",
        "noinsert",
    }

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
            local bufnr = ev.buf
            local client = vim.lsp.get_client_by_id(ev.data.client_id)
            default_mappings(client.id, bufnr)
            if client.name == "dafny" then
                setup_dafny()
            end
            -- if client:supports_method("textDocument/completion") then
            --     vim.lsp.completion.enable(true, client.id, ev.buf, {
            --         autotrigger = true
            --     })
            -- end
        end,
    })

end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "hrsh7th/cmp-nvim-lsp", -- TODO: are other dependencies needed?
        "hrsh7th/nvim-cmp",
        "SirVer/ultisnips",
    },
    -- event = "VeryLazy",
    config = config,
}
