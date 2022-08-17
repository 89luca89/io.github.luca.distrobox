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

# Usage

`flatpak run io.github.luca.distrobox`

And use it as you normally would use distrobox.
It is handy to put an alias in your shell to shorten the command: `alias distrobox="flatpak run io.github.luca.distrobox"` 

Usage is the same as the normal app, just the command name changes from `distrobox` to  `flatpak run io.github.luca.distrobox` 

# Credits

This work is originated on the manifest of [@axtloss](https://github.com/axtloss) in [axtloss/flatpaks](https://github.com/axtloss/flatpaks) and
of [@mirkobrombin](https://github.com/mirkobrombin) in [AtomsDevs/Atoms](https://github.com/AtomsDevs/Atoms/)
