# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools linux-info

DESCRIPTION="CODA Distributed Filesystem"
HOMEPAGE="coda.cs.cmu.edu"
SRC_URI="https://github.com/cmusatyalab/coda/archive/refs/tags/${P}.tar.gz"
S="${WORKDIR}/${PN}-${P}"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CONFIG_CHECK="CODA_FS"

DEPEND="
dev-libs/libuv
net-libs/gnutls
dev-lang/lua
>=sys-libs/ncurses-6"

RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare(){
	default

	eautoreconf
}

src_configure() {
	econf --with-lua
}
