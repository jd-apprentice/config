# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="half-life"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf alias-finder zsh-autosuggestions)
ZSH_ALIAS_FINDER_AUTOMATIC=true
bindkey '^ ' autosuggest-accept
source $ZSH/oh-my-zsh.sh

# Aliases
alias ..="cd .."
alias work="cd ~/Documents/Trabajo"
alias projects="cd ~/Documents/Proyectos"
alias uni="cd ~/Documents/Universidad"
alias c="clear"
alias x="exit"
alias conf="vim ~/.config/kitty/kitty.conf"
