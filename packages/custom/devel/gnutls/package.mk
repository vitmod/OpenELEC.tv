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

PKG_NAME="gnutls"
PKG_VERSION="3.4.5"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.gnutls.org"
PKG_URL="ftp://ftp.gnutls.org/gcrypt/gnutls/v3.4/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain nettle gmp libidn"
PKG_PRIORITY="optional"
PKG_SECTION="custom/devel"
PKG_SHORTDESC="GnuTLS is a portable library which implements the Transport Layer Security (TLS 1.0, 1.1, 1.2) and Secure Sockets Layer (SSL) 3.0 and Datagram Transport Layer Security (DTLS 1.0, 1.2) protocols."
PKG_LONGDESC="GnuTLS is a portable library which implements the Transport Layer Security (TLS 1.0, 1.1, 1.2) and Secure Sockets Layer (SSL) 3.0 and Datagram Transport Layer Security (DTLS 1.0, 1.2) protocols."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared --with-included-libtasn1 --without-p11-kit"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
