##
## ┌─┐┌─┐┬ ┬┬─┐┌─┐
## ┌─┘└─┐├─┤├┬┘│
## └─┘└─┘┴ ┴┴└─└─┘
##

declare -a file=(
  theme
  env
  aliases
  utility
  options
  plugins
  keybinds
  starship
  startx
)

for file in ${file[@]}
do
  source "$ZDOTDIR/$file.zsh"
done
