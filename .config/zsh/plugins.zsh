##
## ┌─┐┬  ┬ ┬┌─┐┬┌┐┌┌─┐
## ├─┘│  │ ││ ┬││││└─┐
## ┴  ┴─┘└─┘└─┘┴┘└┘└─┘
##

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light hlissner/zsh-autopair
zinit light MichaelAquilina/zsh-you-should-use

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

autoload -U compinit
compinit -d "$XDG_CACHE_HOME/zsh/.zcompdump"

zinit cdreplay -q

source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"
