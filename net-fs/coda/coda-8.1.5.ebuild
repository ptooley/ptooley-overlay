# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10} )

inherit autotools linux-info python-single-r1

DESCRIPTION="CODA Distributed Filesystem"
HOMEPAGE="http://coda.cs.cmu.edu"
SRC_URI="https://github.com/cmusatyalab/coda/archive/refs/tags/${P}.tar.gz"
S="${WORKDIR}/${PN}-${P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CONFIG_CHECK="~CODA_FS"
WARNING_CODA_FS="The CODA client requires kernel module support from CONFIG_CODA_FS.
If you only require the server you can safely ignore this message."

DEPEND="
	dev-libs/libuv
	net-libs/gnutls
	dev-lang/lua:5.1
	>=sys-libs/ncurses-6
	$(python_gen_cond_dep '
		dev-python/attrs[${PYTHON_USEDEP}]
	')
"

RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare(){
	default

	eautoreconf
}

src_configure() {
	econf --with-lua --without-python
}
