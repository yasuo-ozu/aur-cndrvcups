.PHONY:	pkg clean
pkg:	PKGBUILD
	makepkg -f
clean:
	rm -rf src pkg
	rm -f *.tar.xz *.tar.gz
install:	pkg
	sudo pacman -U *.tar.xz

