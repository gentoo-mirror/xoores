# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://github.com/albfan/${PN}.git"
EGIT_COMMIT="993b6d637d9c16b7a0115d6d1ef45b9d996aadd7"

inherit git-r3 cmake

DESCRIPTION="Connect external monitors to your system via Wifi-Display specification also known as Miracast"
HOMEPAGE="https://github.com/albfan/miraclecast"
RESTRICT="bindist mirror"

LICENSE="LGPL-2+"
SLOT="0"
IUSE="systemd debug test"
KEYWORDS="-* ~amd64 ~x86"

BDEPEND="
	dev-build/cmake
	>=dev-libs/glib-2.38
	media-libs/gstreamer
	net-wireless/wpa_supplicant
	systemd? ( >=sys-apps/systemd-213 )
	!systemd? ( >=sys-auth/elogind-213 )
	test? ( dev-libs/check )
"

src_configure() {
	local mycmakeargs=(
		-DENABLE_SYSTEMD=$(usex systemd ON OFF)
		-DBUILD_ENABLE_DEBUG=$(usex systemd ON OFF)
	)
	
	cmake_src_configure
}
