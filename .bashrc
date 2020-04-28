# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

kshell () {
	if [ "$#" -eq 1 ]; then 
		echo "----> --> $1"
		env NAMESPACE=$1 /bin/bash --rcfile ~/.kbashrc
		return
	fi
	kubectl get namespaces | awk '{print $1}' | nl -w2 -bp[a-z] -s'. ' 
	max=`kubectl get namespaces | wc -l`
	while true; do
		echo -n "Select a namespace [0 to quit] > "
		read selection
		if [ $selection -eq 0 ]; then 
			return
		elif [ $selection -gt 0 ] && [ $selection -lt $max ]; then 
			namespace=$(kubectl get namespaces | grep -v NAME | sed -n "$selection p" | cut -d" " -f1)
			export NAMESPACE=$namespace 
			source ~/.kbashrc
			return
		fi
	done

}


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
