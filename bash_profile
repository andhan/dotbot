if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

source ~/.env
source ~/.alias

# Includes
source /usr/local/Cellar/bash-completion/1.3_3/etc/profile.d/bash_completion.sh
#source ~/.git-completion.bash
source ~/.tmux.completion.bash
source ~/.tmuxinator.completion.bash
source ~/.functions



# PATH
export PATH=$PATH:$GIGASPACES_HOME/bin:$HOME/bin

# Prompt
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

