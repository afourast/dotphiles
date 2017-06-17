gsettings set org.gnome.desktop.interface scaling-factor 2
xrandr --output eDP1 --scale 1x1
PYCHARM_PATH=~/.PyCharm2016.2
OPT_FILEPATH=$PYCHARM_PATH/config/options/colors.scheme.xml
sed -i 's/Default copy/zoomed/g' $OPT_FILEPATH
