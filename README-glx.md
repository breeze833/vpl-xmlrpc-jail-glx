# GLX Support for Running a Program

While preparing the VPL for raylib based applications, I discovered that the default VNC server (mine is TightVNC) does not support GLX extension. There are a few discussions on the forums, and the popular cited one is VirtualGL and TigerVNC. The solution requires a client that supports the connection to the VirtualGL. It would require a lot of work to integrate it into VPL. Therefore, I tried to add the GLX support by using GLX-enabled X servers.

## Installation

I don't want to change the original code too much. The reason is that my solutions should be considered ad-hoc.

Therefore, in addition to the installation procedure of the original VPL. Additional manual steps are reuired:

* make sure that the scripts `vpl_{glx,xpra,vnc}*.sh` are copied to `/usr/sbin/vpl/`
* make sure that Xephyr and/or Xpra are insatlled

The files are added/modified to support the GLX run-time environment. Of course, the resource consumption would be higher than the regular graphical run-time is.

## Description of the Xephyr Approach

The first solution is to start a nested X server called Xephyr in the VNC. The Xephyr is implemented using Kdriver and has GLX enabled. The advantage of this approach is lower resource requirements. The disadvantages are (1) additional one DISPLAY number is consumed by the Xephyr, and (2) the keyboard events do not work properly.

### Use Xephyr for GLX

In a VPL activity,

* memory limit should be more than 256MB
* add an execution file `.glx_required`
* keep `.glx_required` when running the program

## Description of the Xpra Approach

The second solution is to replace the regular VNC server with the Xpra. The Xpra support RFB protocol and GLX. The approach requires more memory and the start/stop is a bit slower. The advantages are that its GLX rendering is smoother and keyboard enevts are handled properly.

### Use Xpra for GLX

In a VPL activity,

* memory limit should be more than 512MB
* add an execution file `.xpra_required`
* keep `.xpra_required` when running the program

