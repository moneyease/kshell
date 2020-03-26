# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

kshell () {
#	listnamespace=$(kubectl get namespaces | grep -v NAME | awk '{print $1}')
	SESSION=`date +%s`

	if [ "$#" -eq 1 ]; then 
        	tmux -f ~/.tmux.conf new-session -s $SESSION -d
	        tmux set-option -s -t $SESSION default-command "env NAMESPACE=$1 /bin/bash --rcfile ~/.kbashrc"
                tmux send-key "source ~/.kbashrc $1" Enter
        	tmux attach-session -d
		tmux rename-window $NAMESPACE
		#found=`${listnamespace} | grep -c $1`
		#if [ $found -eq 0 ];then
		#	echo "invalid namespace $1"
		#else
	#	env NAMESPACE=$1 /bin/bash --rcfile ~/.kbashrc
		#fi
	else
		echo "Please set a namespace from the list below [usage: kshell <namespace>]"
		kubectl get namespaces | grep -v NAME | awk '{print $1}'
#		echo ${listnamespace}
	fi
}


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
