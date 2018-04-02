# Maintainer: Yasuo Ozu <yasuo@ozu.email>
pkgname=cndrvcups
pkgver=3.90.1
pkgrel=1
epoch=
pkgdesc="Canon Printer Driver Common Modules / Canon LIPSLX Printer Driver for Linux, This LIPSLX printer driver provides printing functions for Canon LBP/iR printers operating under the CUPS (Common UNIX Printing System) environment."
arch=("x86_64")
url=""
license=('custom')
groups=()
depends=("glibc" "libglade" "libxml2" "glib2" "gtk2" "gcc-libs" "cups" "libcups" "ghostscript")
makedepends=("binutils" "tar" "coreutils" "sed")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://gdlp01.c-wss.com/gds/8/0100004158/16/linux-lipslx-drv-v350-jp.tar.gz")
md5sums=('4a9faffb541dbef650c89a3eee4a8840')

prepare() {
	cd ${srcdir}
	tar -xvf linux-lipslx-drv-v350-jp.tar.gz
	mkdir -p lipslx common
	mv linux-lipslx-drv-v350-jp/64-bit_Driver/Debian/cndrvcups-lipslx_3.50-1_amd64.deb ./lipslx/
	mv linux-lipslx-drv-v350-jp/64-bit_Driver/Debian/cndrvcups-common_3.90-1_amd64.deb ./common/
	cd lipslx
	ar vx cndrvcups-lipslx_3.50-1_amd64.deb
	tar -xvf data.tar.gz
	tar -xvf control.tar.gz
	cd ${srcdir}/common
	ar vx cndrvcups-common_3.90-1_amd64.deb
	tar -xvf data.tar.gz
	tar -xvf control.tar.gz
}

pkgver() {
	cd ${srcdir}/common && cat control | sed -ne '/Version:/p' | sed -e 's/^Version:\s\(.*\)$/\1/' | sed -e 's/-/./g'
}

build() {
	:
}

package() {
	cp -rf ${srcdir}/lipslx/usr ${pkgdir}/
	cp -rf ${srcdir}/common/usr ${pkgdir}/
	cp -rf ${srcdir}/common/etc ${pkgdir}/
	mkdir -p ${pkgdir}/usr/share/ppd
	cd ${pkgdir}/usr/share/cups/model
	for fn in CN*ZJ.ppd ; do \
		ln -sf "/usr/share/cups/model/"$fn ${pkgdir}/usr/share/ppd/$fn
	done
	chmod 4755 ${pkgdir}/usr/bin/cnpkmoduleufr2
	mkdir -p   ${pkgdir}/etc/cngplp/account
	chmod 777  ${pkgdir}/etc/cngplp/account
	mkdir -p   ${pkgdir}/etc/cngplp/options
	chmod 777  ${pkgdir}/etc/cngplp/options
}
