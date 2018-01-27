# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/mysql/bin/

# Path to your oh-my-zsh installation.
export ZSH=/Users/balapa/.oh-my-zsh
export LANG=C

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
	vi-mode
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

# vim open folder
alias v="vim ."
# nvim open folder
alias nv="nvim ."
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
# monokai vim
alias monovim="nvim ~/.vim/bundle/vim-sublime-monokai/colors/monokai.vim"

# projects
alias jirapp="cd ~/Documents/Icreon/jirapp-project/jirapp-source"
alias icrtime="cd ~/Documents/Icreon/IcreonTime"
alias os="cd ~/Documents/Open\ Source/"
alias icr="cd ~/Documents/Icreon/"
alias icrus="cd ~/Documents/Icreon/icreonus-new/icreonus-source"

# uiplease
alias uip="cd ~/Documents/uiplease-project/uiplease"
alias lh="open http://localhost:1313"

# hugo
alias hs="hugo server"
alias push="git push origin master"
alias sass="npm run sass"

# david zwirner
alias zwirner="cd ~/Documents/Icreon/davidzwirner-root-wp/davidzwirner"
alias dzc="cd ~/Documents/Icreon/davidzwirner-chinese"

# dotfiles git config : https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias myconfig='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
