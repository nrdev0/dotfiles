# dotfiles

```sh
# Ubuntu/Debian prerequisites; install Herdr, Starship, and Deja separately.
sudo apt-get install stow zsh fzf git build-essential ripgrep fd-find unzip lazygit

# Clone and enter the repo.
git clone https://github.com/nrdev0/dotfiles.git "$HOME/dev/dotfiles"
cd "$HOME/dev/dotfiles"

# Back up existing configs before linking (skip existing symlinks).
backup_dir="$HOME/.local/state/dotfiles/backups/$(date +%Y%m%dT%H%M%S)"
for config in .zshrc .zshenv .config/starship.toml .config/herdr/config.toml .config/alacritty .config/nvim; do
  if [ -e "$HOME/$config" ] && [ ! -L "$HOME/$config" ]; then
    mkdir -p "$backup_dir/$(dirname "$config")"
    mv "$HOME/$config" "$backup_dir/$config"
  fi
done

# Preview and create links.
stow --simulate --verbose --no-folding --target="$HOME" alacritty herdr starship zsh nvim
stow --verbose --no-folding --target="$HOME" alacritty herdr starship zsh nvim

# Start Zsh.
exec zsh
```

```sh
# Remove links (run from the repo).
stow --delete --target="$HOME" alacritty herdr starship zsh nvim
```

LazyVim uses the configuration in `nvim/.config/nvim`. On Ubuntu x86_64,
install the official stable Neovim archive and Tree-sitter CLI before starting it:

```sh
curl -fL -o /tmp/nvim-linux-x86_64.tar.gz \
  https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
mkdir -p "$HOME/.local/opt"
tar -xzf /tmp/nvim-linux-x86_64.tar.gz -C "$HOME/.local/opt"

curl -fL -o /tmp/tree-sitter-linux-x64.gz \
  https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-x64.gz
gzip -dc /tmp/tree-sitter-linux-x64.gz > /tmp/tree-sitter-cli
mkdir -p "$HOME/.local/bin"
install -m 755 /tmp/tree-sitter-cli "$HOME/.local/bin/tree-sitter"

# The Zsh dotfiles add both installation directories to PATH.
exec zsh
```

Run `nvim` to install plugins, then `:LazyHealth` to check the setup.
Use `:LazyExtras` to enable language support. Keep `lazy-lock.json` and
`lazyvim.json` in the Stow package so plugin versions and enabled extras stay
with your dotfiles. Alacritty selects JetBrainsMono Nerd Font; install that font
on the machine running your terminal for the icons to display correctly.
