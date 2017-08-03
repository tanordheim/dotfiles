all: xrescfg i3cfg

xrescfg:
	rm -f Xresources-desktop Xresources-laptop
	cat Xresources | sed 's/__XFT_DPI__/120/g' > Xresources-desktop
	cat Xresources | sed 's/__XFT_DPI__/160/g' > Xresources-laptop

i3cfg:
	rm -f i3/config-desktop i3/config-laptop
	cp i3/config i3/config-desktop
	cp i3/config i3/config-laptop
	sed -i -e '/__WORKSPACE_NAMES__/{r i3/ws-names-desktop' -e 'd}' i3/config-desktop
	sed -i -e '/__WORKSPACE_DISPLAYS__/{r i3/ws-displays-desktop' -e 'd}' i3/config-desktop
	sed -i -e '/__WORKSPACE_SWITCH__/{r i3/ws-switch-desktop' -e 'd}' i3/config-desktop
	sed -i -e '/__WORKSPACE_NAMES__/{r i3/ws-names-laptop' -e 'd}' i3/config-laptop
	sed -i -e '/__WORKSPACE_DISPLAYS__/{r i3/ws-displays-laptop' -e 'd}' i3/config-laptop
	sed -i -e '/__WORKSPACE_SWITCH__/{r i3/ws-switch-laptop' -e 'd}' i3/config-laptop
