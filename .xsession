xrdb -merge .Xresources

if [ -x /usr/bin/xfce4-power-manager ] ; then
   sleep 1
   xfce4-power-manager &
fi

while true; do
   xsetroot -name "MEM: $(free -m | awk '/Mem/{print $3}') | $( date +"%F %I:%M %p" )"
   sleep 10
done &

nm-applet &
pa-applet &
xset r rate 200 30 &
setxkbmap -option caps:escape -layout 'us(altgr-intl)' &

xrdb -merge ~/.Xresources
exec dwm
