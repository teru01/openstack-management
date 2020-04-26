#!/bin/bash

help () {
	echo "Usage: control.sh [arg]"
	echo ""
	echo "args"
	echo "upall: up all nodes"
	echo "downall: down all nodes"
	echo "snapshot: take snapshot of all nodes"
	exit 0
}

if [ $# -ne 1 ]; then
	echo -n "invalid arg number "
	help
	exit 1
fi

if [ $1 = "upall" ]; then
	vboxmanage startvm controller
	vboxmanage startvm compute1
elif [ $1 = "downall" ]; then
	vboxmanage controlvm controller poweroff
	vboxmanage controlvm compute1 poweroff
elif [ $1 = "snapshot" ]; then
	vboxmanage snapshot "controller" take "controller-$(date +%F-%H-%M-%S%Z)"
	vboxmanage snapshot "compute1" take "compute1-$(date +%F-%H-%M-%S%Z)"
elif [ $1 = "help" ]; then
	help
else
	echo "undefined operation"
fi

