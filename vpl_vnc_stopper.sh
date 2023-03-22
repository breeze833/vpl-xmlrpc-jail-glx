#!/bin/bash
if [ -f $HOME/.xpra_required -a -n `which xpra` ]; then
	exec /usr/sbin/vpl/vpl_xpra_stopper.sh
fi
VNCDISPLAY=$(ls $HOME/.vnc/*.log | sed -e "s/[^:]*://" -e "s/\.log$//")
vncserver -kill :$VNCDISPLAY
