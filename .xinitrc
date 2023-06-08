#!/bin/sh

xsetroot -cursor_name left_ptr &
pulseaudio &
dunst &
# exec awesome
# exec dwm
exec bspwm
