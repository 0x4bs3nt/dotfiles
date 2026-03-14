return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
        { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal' },
    },
    opts = {
        default_component_configs = {
            indent = {
                with_expanders = true,
                expander_collapsed = '',
                expander_expanded = '',
                expander_highlight = 'NeoTreeExpander',
            },
            icon = {
                folder_closed = '󰉋',
                folder_open = '󰝰',
                folder_empty = '󰉖',
            },
            modified = {
                symbol = '●',
            },
            git_status = {
                symbols = {
                    added = '',
                    modified = '',
                    deleted = '✖',
                    renamed = '󰁕',
                    untracked = '',
                    ignored = '',
                    unstaged = '󰄱',
                    staged = '',
                    conflict = '',
                },
            },
        },
        window = {
            width = 35,
            mappings = {
                ['\\'] = 'close_window',
            },
        },
        filesystem = {
            filtered_items = {
                visible = false,
                hide_dotfiles = true,
                hide_gitignored = true,
            },
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
            window = {
                mappings = {
                    ['\\'] = 'close_window',
                },
            },
        },
    },
}
