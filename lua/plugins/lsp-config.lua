return {{
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
        require("mason").setup()
    end
}, {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
        auto_install = true
    },
    ensure_installed = {'tsserver', "ts_ls", 'html', 'cssls', 'lua_ls', 'tailwindcss', 'eslint'}
}, {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Configurações por servidor
        vim.lsp.config["tsserver"] = {
            capabilities = capabilities
        }

        vim.lsp.config["html"] = {
            capabilities = capabilities
        }

        vim.lsp.config["cssls"] = {
            capabilities = capabilities
        }

        vim.lsp.config["tailwindcss"] = {
            capabilities = capabilities
        }

        vim.lsp.config["eslint"] = {
            capabilities = capabilities
        }

        vim.lsp.config["lua_ls"] = {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {"vim"}
                    }
                }
            }
        }

        -- Habilita todos
        vim.lsp.enable({"tsserver", "ts_ls", "html", "cssls", "eslint", "tailwindcss", "lua_ls"})

        -- Keymaps
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end
}}
