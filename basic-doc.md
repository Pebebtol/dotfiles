## Documentation for some settings

### Lid close

edit/create `/etc/systemd/system/i3lock.service`

[Unit]
Description=i3lock on suspend
Before=sleep.target

[Service]
User=$(name)
Type=forking
Environment=DISPLAY=:0
ExecStart=/usr/bin/i3lock -c 193314 # or any other locker

[Install]
WantedBy=sleep.target

### i3 auto lock service

* create locker serivce in `/usr/bin/`
* put locker service into the lock script in `/usr/bin/i3exit` where needed

### mv control to prsc and touchpad toggle to control_r

* cd /usr/share/X11/xkb/symbols/
* backup pc
* modify the line `key <RCTL> {	[ XF86TouchpadToggle	]	};`
* add the line `key <PRSC> {    [ Control_R             ]       };`
