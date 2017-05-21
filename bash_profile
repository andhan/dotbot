if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# Includes
source ~/.git-completion.bash
source ~/.functions

source ~/.alias
source ~/.env
source ~/.env-local

# Prompt
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
