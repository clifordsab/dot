#!/bin/sh
#
# Auto-install config.

# create needed directories
mkdir -p /etc/systemd/logind.conf.d/

# bashrc
printf '\n%s\n' "[[ -f $HOME/.config/bash/rc ]] && . $HOME/.config/bash/rc" >> /etc/bash.bashrc

# bash_profile
ln -sf "$HOME/.config/bash/profile" /etc/profile.d/profile.sh

# systemd
printf '%s\n' \
"[Login]
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore" > /etc/systemd/logind.conf.d/20-ignore-lid-events.conf
