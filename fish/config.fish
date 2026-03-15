if status is-interactive
    # Homebrew Path (Important for Apple Silicon Macs)
    eval (/opt/homebrew/bin/brew shellenv)

    # Python 3.12 Paths
    fish_add_path /opt/homebrew/opt/python@3.12/bin

    # PostgreSQL 16 Path
    fish_add_path /opt/homebrew/opt/postgresql@16/bin

    # Homebrew lib path for WeasyPrint and other native libs
    set -gx DYLD_LIBRARY_PATH /opt/homebrew/lib $DYLD_LIBRARY_PATH

    # Source the env script if it exists
    if test -f "$HOME/.local/bin/env"
        # Note: Fish handles sourcing differently;
        # If that env file contains 'export' commands,
        # it might need manual conversion or a plugin like 'bass'
    end

    # Auto-activate .venv when entering a directory that has one
    function __auto_venv --on-variable PWD
        if test -f "$PWD/.venv/bin/activate.fish"
            source "$PWD/.venv/bin/activate.fish"
        else if set -q VIRTUAL_ENV
            # Deactivate if we left the venv's project directory
            if not string match -q "$PWD*" "$VIRTUAL_ENV"
                deactivate
            end
        end
    end
    # Run on shell start for the initial directory
    __auto_venv
end
set -gx EDITOR nvim
alias lg="lazygit"
alias ll="eza --long --all --group --group-directories-first --icons=auto --header --colour-scale=size --time-style=relative"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
