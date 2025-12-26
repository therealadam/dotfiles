# Dotfiles management - wrapper around mise tasks
# For full task list: mise tasks

# Set up dotfiles by creating symlinks
setup:
    mise run setup

# Backup existing dotfiles to timestamped directory
backup:
    mise run backup

# Find dotfiles in ~ that aren't managed by this repository
unmanaged:
    mise run unmanaged

# List all available tasks
list:
    @mise tasks
