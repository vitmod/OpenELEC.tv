################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="kodi-addon-transmission"
PKG_VERSION="10f319d"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/correl/Transmission-XBMC.git"
PKG_GIT_URL="https://github.com/correl/Transmission-XBMC.git"
PKG_GIT_BRANCH="master"
PKG_KEEP_CHECKOUT="yes"
PKG_DEPENDS_TARGET="toolchain Python kodi kodi-module-simplejson kodi-module-beautifulsoup kodi-module-six"
PKG_PRIORITY="optional"
PKG_SECTION="custom/mediacentre"
PKG_SHORTDESC="A client for the popular Transmission BitTorrent application."
PKG_LONGDESC="Transmission-XBMC supports viewing, adding, removing, starting and stopping torrents. More advanced features may be added in future releases."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

post_unpack() {
  for patch in `ls $PKG_DIR/patches.upstream/*.patch`; do
    cat $patch | patch -d \
    `echo $BUILD/$PKG_NAME-$PKG_VERSION | cut -f1 -d\ ` -p1
  done
}

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

post_install() {
  mkdir -p $INSTALL/usr/share/kodi/addons/script.transmission
    cp -PR $PKG_BUILD/* $INSTALL/usr/share/kodi/addons/script.transmission

  mkdir -p $INSTALL/usr/share/kodi/addons/script.transmission/resources/skins
    cp -PR $PKG_DIR/skins/* $INSTALL/usr/share/kodi/addons/script.transmission/resources/skins

  python -Wi -t -B $ROOT/$TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/script.transmission/resources/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/script.transmission/resources/lib/ -name "*.py"`
}