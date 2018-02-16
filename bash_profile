if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# Includes
source ~/.git-completion.bash
source ~/.tmux.completion.bash
source ~/.tmuxinator.completion.bash
source ~/.functions

source ~/.alias
source ~/.env

#load env specific overrides if present
if [ -f ~/.env-local ]; then
	source ~/.env-local
fi

# PATH
export PATH=$PATH:$GIGASPACES_HOME/bin:$HOME/bin

# Prompt
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
