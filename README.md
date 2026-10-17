# dotfiles

```sh
cd "$HOME/dev/dotfiles"

# Preview links.
stow --simulate --verbose --no-folding --target="$HOME" alacritty herdr tmux

# Create links.
stow --verbose --no-folding --target="$HOME" alacritty herdr tmux

# Remove links.
stow --delete --target="$HOME" alacritty herdr tmux
```

[Gruvbox tmux theme](https://github.com/egel/tmux-gruvbox)
