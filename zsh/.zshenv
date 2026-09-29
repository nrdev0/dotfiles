# Guest shell environment, including tools installed in ~/.local/bin.
typeset -U path
path=("$HOME/.local/bin" $path /usr/sbin /sbin)
if [[ -d "$HOME/bin" ]]; then
  path=("$HOME/bin" $path)
fi
export PATH
