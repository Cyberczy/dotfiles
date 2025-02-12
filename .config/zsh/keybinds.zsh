##
## ┬┌─┌─┐┬ ┬┌┐ ┬┌┐┌┌┬┐┌─┐
## ├┴┐├┤ └┬┘├┴┐││││ ││└─┐
## ┴ ┴└─┘ ┴ └─┘┴┘└┘─┴┘└─┘
##

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey -s '^K' 'ls^M'
bindkey -s '^O' '_smooth_fzf^M'
bindkey -M emacs '^B' _sudo_command_line
