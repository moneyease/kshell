# kshell
This is small utility to ease your kubernetes day to day operation. This command 'kshell <namespace>' open a new tmux session with custom commands.
User can set a namespace>pod>container name to do regular operation.


 pod       [pod][container]      Display pod status
 service                         Service
 container [container number]    Choose a container from the list
 describe                        Describe the pod
 bash                            Enter a shell
 cmd     <command>               Run a command in a container
 cpto    <local> <remote>        Copy from local to pod
 cpfrom  <remote> <local>        Copy from pod to local
 log [-f]                        Container log
 split                           Split pane [C-A y to send command to all panes]

