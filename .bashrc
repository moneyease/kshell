# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

kshell () {
	if [ "$#" -eq 1 ]; then 
#		source ~/.kbashrc $1
		env NAMESPACE=$1 /bin/bash --rcfile ~/.kbashrc
	else
		echo "Please set a namespace from the list below [usage: kshell <namespace>]"
		kubectl get namespaces | grep -v NAME | awk '{print $1}'
	fi
}


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
