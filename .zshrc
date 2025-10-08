# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Scripts path
[[ ":$PATH:" != *":$HOME/scripts:"* ]] && export PATH="$HOME/scripts:$PATH"
[ -s /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh

# Path to Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Terminal vim mode
bindkey -v

# Set correct TERM
export TERM="xterm-256color"

# Cursor shape change: beam (5) for insert, block (1) for normal
function zle-keymap-select {
  case $KEYMAP in
    vicmd) printf '\e[2 q' ;;  # block
    main|viins) printf '\e[6 q' ;; # beam
  esac
}
zle -N zle-keymap-select

function zle-line-init {
  printf '\e[6 q'  # beam at start
}
zle -N zle-line-init

# Fix prompt redraw issue
export ZLE_RPROMPT_INDENT=0

# Improve delay
KEYTIMEOUT=1

# ALIAS
alias vim="nvim"
alias ls="lsd"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Load Angular CLI autocompletion.
source <(ng completion script)
