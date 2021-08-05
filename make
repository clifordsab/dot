#!/bin/sh
#
# Auto-install config.

# create needed directories
mkdir -p files/mpv/scripts/ \
         files/wget \
         /etc/systemd/logind.conf.d/

# bashrc
printf '\n%s\n' "[[ -f $HOME/.config/bash/rc ]] && . $HOME/.config/bash/rc" >> /etc/bash.bashrc

# bash_profile
ln -sf "$HOME/.config/bash/profile" /etc/profile.d/profile.sh

# mpv-mpris
git clone https://github.com/hoyon/mpv-mpris
make -C mpv-mpris
mv -f mpv-mpris/mpris.so files/mpv/scripts/

# systemd
cp -f files/systemd/logind.conf.d/20-ignore-lid-events.conf \
      /etc/systemd/logind.conf.d/

# wget
prinft '%s\n' "hsts-file = $HOME/.local/share/wget/hsts" > files/wget/wgetrc

# directories
# shellcheck disable=2016
prinft '%s\n' 'XDG_DESKTOP_DIR="$HOME/"' > files/user-dirs.dirs

# copy config
find files -type f | while read -r file; do
    _file=$HOME/.config/${file#*/}

    mkdir -p "${_file%/*}"

    cp -f "$file" "$_file"
done

# cleanup
rm -rf files/mpv/scripts
rm -rf files/wget
rm -rf mpv-mpris
