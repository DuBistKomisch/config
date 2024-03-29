export PATH="$HOME/bin:$PATH"
export EDITOR="vim"
export BROWSER="firefox-developer-edition"

# history
unset HISTFILE
export LESSHISTFILE="-"
export NODE_REPL_HISTORY=""

# aliases
alias ls='ls --color=auto' # force ls colors
alias sudo='sudo -E ' # let sudo use our aliases and keep our env

# prompt
PS1='\n\[$(tput setaf 2)\]\u@\h \[$(tput setaf 6)\]\j+ \[$(tput setaf 3)\]\w \[$(tput setaf 5)\]$(git symbolic-ref --short HEAD 2>/dev/null) \[$(tput setaf 7)\]\n \$\[$(tput setaf 7)\] '
PS2=' >\[$(tput setaf 7)\] '

# ruby
eval "$(rbenv init - --no-rehash 2>/dev/null)"

# disable ctrl-s/q flow control
stty -ixon

# https://github.com/BurntSushi/ripgrep/issues/1719
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# view man pages in vim
export MANPAGER="vim -M +MANPAGER -"
