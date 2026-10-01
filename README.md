# dotfiles

```sh
cd "$HOME/dev/dotfiles"

# Preview links.
stow --simulate --verbose --no-folding --target="$HOME" alacritty herdr 

# Create links.
stow --verbose --no-folding --target="$HOME" alacritty herdr 

# Remove links.
stow --delete --target="$HOME" alacritty herdr 
```
