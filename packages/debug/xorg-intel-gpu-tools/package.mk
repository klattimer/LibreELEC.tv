# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="xorg-intel-gpu-tools"
PKG_VERSION="1.27"
PKG_SHA256="602bfe310d669f58e2f7fc8839532368492fd1317d564e06f8ce42049e3b61cb"
PKG_LICENSE="GPL"
PKG_DEPENDS_TARGET="toolchain cairo procps-ng"
PKG_SITE="https://gitlab.freedesktop.org/drm/igt-gpu-tools"
PKG_URL="https://www.x.org/releases/individual/app/igt-gpu-tools-${PKG_VERSION}.tar.xz"
PKG_LONGDESC="Test suite and tools for DRM/KMS drivers"

PKG_MESON_OPTS_TARGET="-Dchamelium=disabled \
                       -Ddocs=disabled \
                       -Dlibdrm_drivers=auto \
                       -Dlibunwind=disabled \
                       -Dman=disabled \
                       -Doverlay=disabled \
                       -Drunner=disabled \
                       -Dtests=enabled \
                       -Dvalgrind=disabled"

pre_configure_target() {
  # xorg-intel-gpu-tools does not build with NDEBUG (requires assert for tests)
  export TARGET_CFLAGS=$(echo ${TARGET_CFLAGS} | sed -e "s|-DNDEBUG||g")
}
