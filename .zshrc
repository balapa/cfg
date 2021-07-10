# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/mysql/bin/

# Path to your oh-my-zsh installation.
export ZSH=/Users/balapa/.oh-my-zsh
export LANG=C
export PATH=`pwd`/flutter/bin:$PATH
export PATH=$PATH:/Applications/Genymotion.app/Contents/MacOS/tools

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # git
  zsh-syntax-highlighting
	vi-mode
	docker
)

source $ZSH/oh-my-zsh.sh

# pure theme
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL="$"
prompt pure

# pure is one line
prompt_newline='%666v'
PROMPT=" $PROMPT"

# no bell on ambiguous completion
unsetopt list_beep

# ALIASES

# nvim open folder
alias vim="nvim"
# sublime
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
# git
alias gs="git status"
alias gpom="git push origin master"
# vimrc
alias vimrc="nvim ~/.vimrc"
# ZSHRC
alias zshrc="nvim ~/.zshrc"
alias sozshrc="source ~/.zshrc"
# tmux
alias tl="tmux list-sessions"
alias ta="tmux attach"
alias tconf="nvim ~/.tmux.conf"

# hugo
alias hs="hugo server"
alias push="git push origin master"
alias sass="npm run sass"

# dotfiles git config : https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias myconfig='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
