# dotfiles

```sh
cd "$HOME/dev/dotfiles"

# Preview links.
stow --simulate --verbose --no-folding --target="$HOME" alacritty fish herdr nvim

# Create links.
stow --verbose --no-folding --target="$HOME" alacritty fish herdr nvim

# Remove links.
stow --delete --target="$HOME" alacritty fish herdr nvim
```
