#!/bin/bash

export SESSION_NAME="nextgen"




printUsage() {
	echo "NEXTGEN_HOME environment variable must be set to the root of the nextgen git repo"
	exit 1
}


# Set NEXTGEN_HOME to the root of the git repository for nextgen
if [ "${NEXTGEN_HOME}" = "" ] ; then
	printUsage
fi

tmux has-session -t $SESSION_NAME
if [ $?!=0 ]
then
	#create the session
	tmux new-session -s nextgen -n build -d

	#build window with promts at root and pu folders
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m
	tmux split-window -h -t $SESSION_NAME
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME'/nextgen-pu/' C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m
	tmux split-window -v -t $SESSION_NAME:1
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME'/nextgen-market/nextgen-market-pu' C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m

	#test window with promts at root, integration and feature tests
	tmux new-window -n test -t $SESSION_NAME
	tmux select-window -t $SESSION_NAME:2
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m
	tmux split-window -v -t $SESSION_NAME
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME'/nextgen-integration-test' C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m
	tmux split-window -v -t $SESSION_NAME:2.1
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME'/nextgen-feature-test' C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m

	#deploy window with promts at nextgen-pu-deploy and nextgen-marketpu-deploy
	tmux new-window -n deploy -t $SESSION_NAME
	tmux select-window -t $SESSION_NAME:3
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME'/nextgen-pu/nextgen-pu-deploy' C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m
	tmux split-window -h -t $SESSION_NAME:3
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME'/nextgen-market/nextgen-market-pu/nextgen-market-pu-deploy' C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m

	#load window with prompts at nextgen-jmeter, nextgen-jmeter-scenarios
	tmux new-window -n load -t $SESSION_NAME
	tmux select-window -t $SESSION_NAME:4
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME'/nextgen-jmeter-test' C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m
	tmux split-window -h -t $SESSION_NAME:4
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME'/nextgen-jmeter-test/nextgen-jmeter-scenarios' C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m

	#release window with promts at root, nextgen-doc 
	tmux new-window -n release -t $SESSION_NAME
	tmux select-window -t $SESSION_NAME:5
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m
	tmux split-window -h -t $SESSION_NAME:5
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME'/nextgen-doc' C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m

	#monitoring window with promts for the runtime deployment environment
	tmux new-window -n monitor -t $SESSION_NAME
	tmux select-window -t $SESSION_NAME:6
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME'/nextgen-pu/nextgen-pu-deploy' C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m
	tmux split-window -h -t $SESSION_NAME:6
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME'/nextgen-pu/nextgen-pu-deploy' C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m
	tmux split-window -h -t $SESSION_NAME:6.1
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME'/nextgen-pu/nextgen-pu-deploy' C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m
	tmux split-window -h -t $SESSION_NAME:6.2
	tmux send-keys -t $SESSION_NAME 'cd '$NEXTGEN_HOME'/nextgen-pu/nextgen-pu-deploy' C-m
	tmux send-keys -t $SESSION_NAME 'll' C-m
	tmux select-layout -t $SESSION_NAME:6 event-vertical

	tmux select-window -t $SESSION_NAME:1
fi	
tmux attach -t $SESSION_NAME
