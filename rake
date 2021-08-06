#!/bin/sh -e
#
# Auto-install config.

# directories
mkdir -p /etc/systemd/logind.conf.d/

# bashrc
printf '\n%s\n' '[[ -f ~/.config/bash/rc ]] && . ~/.config/bash/rc' >> /etc/bash.bashrc

# bash_profile
ln -sf ~/.config/bash/profile /etc/profile.d/profile.sh

# systemd
printf '%s\n' "[Login]
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore" > /etc/systemd/logind.conf.d/20-ignore-lid-events.conf

# cleanup
rmdir -p /etc/systemd/logind.conf.d/
