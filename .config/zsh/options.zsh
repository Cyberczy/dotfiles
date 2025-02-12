##
## ┌─┐┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
## │ │├─┘ │ ││ ││││└─┐
## └─┘┴   ┴ ┴└─┘┘└┘└─┘
##

umask 022
zmodload zsh/zle
zmodload zsh/zpty
zmodload zsh/complist

autoload -Uz colors
autoload -U compinit
colors

zle -N _sudo_command_line

zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'

HISTFILE="$XDG_CACHE_HOME/zsh/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

ZSH_AUTOSUGGEST_USE_ASYNC="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor regexp root line)
ZSH_HIGHLIGHT_MAXLENGTH=512
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$color8,bold"

declare -a opt=(
  AUTOCD
  AUTO_MENU
  AUTO_PARAM_SLASH
  COMPLETE_IN_WORD
  NO_MENU_COMPLETE
  HASH_LIST_ALL
  ALWAYS_TO_END
  NOTIFY
  NOHUP
  MAILWARN
  INTERACTIVE_COMMENTS
  NOBEEP
  APPEND_HISTORY
  SHARE_HISTORY
  INC_APPEND_HISTORY
  EXTENDED_HISTORY
  HIST_IGNORE_ALL_DUPS
  HIST_IGNORE_SPACE
  HIST_NO_FUNCTIONS
  HIST_EXPIRE_DUPS_FIRST
  HIST_SAVE_NO_DUPS
  HIST_REDUCE_BLANKS
)

for opt in ${opt[@]}
do
  setopt $opt
done

declare -a unopt=(
  FLOWCONTROL
  NOMATCH
  CORRECT
  EQUALS
)

for unopt in ${unopt[@]}
do
  unsetopt $unopt
done

bindkey -e
