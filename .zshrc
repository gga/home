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

autoload -U colors && colors
export PS1="%{$fg_bold[yellow]%}(%m:%~)[%h]
$ %{$reset_color%}"

function ws () { cd $(ruby $NETPAGE_TOOLS/ws.rb $@); }
function wsp () { ruby $NETPAGE_TOOLS/ws.rb $@ }
function pman () { $HOME/bin/pman.sh $@ }

function rbe () { ec -n `gem which $@` }

# Clojure configuration
export CLOJURE_EXT=~/.clojure
export PATH=$PATH:~/dev/github/clojure-contrib/launchers/bash

# Aliases
alias ls='ls -lFGH'
alias man=pman
alias ec=emacsclient
alias clj=clj-env-dir
alias be='bundle exec'
alias br='bundle exec rake'
alias g=git
alias m=less
alias rk=rake

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
