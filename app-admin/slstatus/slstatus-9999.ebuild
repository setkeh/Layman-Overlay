# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop multilib savedconfig toolchain-funcs git-r3 autotools

DESCRIPTION="Suckless Status Tool"
HOMEPAGE="https://tools.suckless.org/slstatus/"
SRC_URI="https://git.suckless.org/slstatus"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~ppc64 ~x86"
IUSE="savedconfig"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXft
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	x11-base/xorg-proto
"

src_unpack() {
  default
  git-r3_fetch ${SRC_URI}
}

src_install() {
  emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install

  dodoc README

  save_config config.h
}

pkg_postinst() {
  elog "Check ${HOMEPAGE} for more Details"
}