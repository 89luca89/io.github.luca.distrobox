HOST_SPAWN_VERSION=1.2.1

all:
	mkdir -p dist
	flatpak-builder \
		--disable-rofiles-fuse \
		--user \
		--repo=dist/repo \
		--state-dir=dist/.flatpak-builder \
		--force-clean dist/tmp/ \
		--default-branch=beta \
		io.github.luca.distrobox.yml
	flatpak build-bundle dist/repo/ dist/io.github.luca.distrobox.flatpak io.github.luca.distrobox beta

install:
	flatpak install --user -y dist/io.github.luca.distrobox.flatpak

clean:
	rm -rf dist
