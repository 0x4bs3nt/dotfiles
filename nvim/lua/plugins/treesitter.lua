return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').setup({
            ensure_installed = {
                'bash',
                'c',
                'diff',
                'html',
                'lua',
                'luadoc',
                'markdown',
                'markdown_inline',
                'query',
                'prisma',
                'vim',
                'vimdoc',
                'javascript',
                'typescript',
                'tsx',
                'css',
                'json',
                'python',
                'rust',
                'go',
                'fish',
            },
            auto_install = true,
        })

        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
