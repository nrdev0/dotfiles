# dotfiles

```sh
# Ubuntu/Debian prerequisites; install Herdr, Starship, and Deja separately.
sudo apt-get install stow zsh fzf git

# Clone and enter the repo.
git clone https://github.com/nrdev0/dotfiles.git "$HOME/dev/dotfiles"
cd "$HOME/dev/dotfiles"

# Back up existing configs before linking (skip existing symlinks).
backup_dir="$HOME/.local/state/dotfiles/backups/$(date +%Y%m%dT%H%M%S)"
for config in .zshrc .zshenv .config/starship.toml .config/herdr/config.toml .config/alacritty; do
  if [ -e "$HOME/$config" ] && [ ! -L "$HOME/$config" ]; then
    mkdir -p "$backup_dir/$(dirname "$config")"
    mv "$HOME/$config" "$backup_dir/$config"
  fi
done

# Preview and create links.
stow --simulate --verbose --no-folding --target="$HOME" alacritty herdr starship zsh
stow --verbose --no-folding --target="$HOME" alacritty herdr starship zsh

# Start Zsh.
exec zsh
```

```sh
# Remove links (run from the repo).
stow --delete --target="$HOME" alacritty herdr starship zsh
```
