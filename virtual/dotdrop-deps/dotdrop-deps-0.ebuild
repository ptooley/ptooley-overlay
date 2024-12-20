# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Virtal for dotdrop dependencies"

SLOT="0"
KEYWORDS="amd64 x86"
DEPEND="
	dev-python/jinja2
	dev-python/docopt
	dev-python/ruamel-yaml
	dev-python/python-magic
	dev-python/packaging
	dev-python/requests
"
RDEPEND="${DEPEND}"
BDEPEND=""
