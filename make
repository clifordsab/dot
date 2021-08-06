#!/bin/sh -e
#
# Auto-install config.

# directories
mkdir -p files/mpv/scripts/ files/wget

# mpv-mpris
git clone https://github.com/hoyon/mpv-mpris
make -C mpv-mpris
mv -f mpv-mpris/mpris.so files/mpv/scripts/

# wgetrc
printf '%s\n' "hsts-file = $HOME/.local/share/wget/hsts" > files/wget/wgetrc

# copy
find files -type f | while read -r file; do
    _file=$HOME/.config/${file#*/}

    mkdir -p "${_file%/*}"

    cp -f "$file" "$_file"
done

# others
# shellcheck disable=2016
printf '%s\n' 'XDG_DESKTOP_DIR="$HOME/"' > "$HOME/.config/user-dirs.dirs"

# cleanup
rm -rf files/mpv/scripts
rm -rf files/wget
rm -rf mpv-mpris
