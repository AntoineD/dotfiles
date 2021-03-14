if [ "$XDG_SESSION_DESKTOP" = "sway" ] ; then
		export QT_QPA_PLATFORM=wayland
	  # https://github.com/swaywm/sway/issues/595
    export _JAVA_AWT_WM_NONREPARENTING=1
fi
