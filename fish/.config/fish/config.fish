# Add personal executables to PATH without duplicates
fish_add_path ~/.local/bin ~/bin

# Preferred programs—use ones you have installed
set -gx EDITOR vim
set -gx VISUAL vim
set -gx PAGER less

if status is-interactive
    # Disable the startup greeting
    set -g fish_greeting

    # Shortcuts that expand visibly when you press Space
    abbr --add gs 'git status'
    abbr --add ga 'git add'
    abbr --add gc 'git commit'
    abbr --add gd 'git diff'

    # Command aliases
    alias ll 'ls -lh'
    alias la 'ls -lah'
end
