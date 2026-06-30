# Ensure ~/.local/bin (uv, uvx, claude) is on PATH
fish_add_path "$HOME/.local/bin"

# Newer uv installers don't write env.fish; source it only if present
if test -f "$HOME/.local/bin/env.fish"
    source "$HOME/.local/bin/env.fish"
end
