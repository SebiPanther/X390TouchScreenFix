Little bit like https://github.com/SebiPanther/X230TabletRotationFix just a little bit more modern for the Lenovo Thinkpad X390 Yoga and deals with the following Problem:
If you plug in another monitor a ubuntu mate 22.10 tries to stretch the touchscreen over all screen. That makes no sense and those Scripts try to deal with it.
You can put the script "X390TouchScreenFix.sh" in "/opt/X390TouchScreenFix/".
The Script belongs "99-monitor-hotplug.rules" into "/etc/udev/rules.d/" and has to be configured correctly.
Don't forget the reload udev with this command: sudo udevadm control --reload-rules
