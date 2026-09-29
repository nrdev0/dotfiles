# Zinit installation
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Completion (initialize before fzf-tab)
autoload -Uz compinit
compinit

# Plugins
zinit light Aloxaf/fzf-tab

# Initialize tools
eval "$(starship init zsh)"
eval "$(deja init zsh)"

# Load after all other editing widgets.
zinit light zsh-users/zsh-syntax-highlighting

# History setup
HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=10000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

