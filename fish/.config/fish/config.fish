# Keep child processes aligned with the active shell.
set -gx SHELL /usr/bin/fish

# Tools installed in the guest home directory.
fish_add_path --path --prepend $HOME/.local/opt/nvim-linux-x86_64/bin $HOME/.local/bin $HOME/bin
fish_add_path --path --append /usr/sbin /sbin
