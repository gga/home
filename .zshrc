# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}'
zstyle :compinstall filename '/home/galexander/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh.d/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
 # End of lines configured by zsh-newuser-install

export PS1="(%m:%~)[%h]
$ "

function ws () { cd $(ruby $NETPAGE_TOOLS/ws.rb $@); }
function wsp () { ruby $NETPAGE_TOOLS/ws.rb $@ }
function pman () { $HOME/bin/pman.sh $@ }

# Aliases
alias ls='ls -lFGH'
alias man=pman
alias ec=emacsclient