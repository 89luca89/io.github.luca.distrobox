# Distrobox flatpak

This is the manifest to build a flatpak to run distrobox.

# Build

```sh
make clean
make
make install
```

Alternatively:

```sh
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

flatpak install --user -y dist/io.github.luca.distrobox.flatpak
```

# Limitations

This flatpak does not really support sandboxing, as the target of distrobox is
tight integration with the host.

# Credits

This work is originated on the manifest of [@axtloss](https://github.com/axtloss) in [axtloss/flatpaks](https://github.com/axtloss/flatpaks) and
of [@mirkobrombin](https://github.com/mirkobrombin) in [AtomsDevs/Atoms](https://github.com/AtomsDevs/Atoms/)
