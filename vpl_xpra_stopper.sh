#!/bin/bash
VNCDISPLAY=`grep "Actual display used" $HOME/.xpra_start.log | awk '{print $4}'`
xpra stop $VNCDISPLAY
