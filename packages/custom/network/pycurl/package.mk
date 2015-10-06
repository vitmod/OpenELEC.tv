################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
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

PKG_NAME="pycurl"
PKG_VERSION="7.19.5"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL-2"
PKG_SITE="http://pycurl.sourceforge.net/"
PKG_URL="http://pycurl.sourceforge.net/download/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python distutilscross:host curl libgcrypt"
PKG_PRIORITY="optional"
PKG_SECTION="custom/network"
PKG_SHORTDESC="pycurl: a Python interface to libcurl"
PKG_LONGDESC="PycURL is a Python interface to libcurl. PycURL can be used to fetch objects identified by a URL from a Python program, similar to the urllib Python module. PycURL is mature, very fast, and supports a lot of features."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDFLAGS="$LDFLAGS -L$SYSROOT_PREFIX/usr/lib -L$SYSROOT_PREFIX/lib"
}

make_target() {
  python setup.py build --cross-compile --with-ssl
}

makeinstall_target() {
  python setup.py install -O0 --no-compile --root=./.install --prefix=/usr
}

post_install() {
  rm -rf .install/usr/bin
  cp -PR $ROOT/$PKG_BUILD/.install/* $INSTALL
}
