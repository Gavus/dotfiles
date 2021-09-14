## Install on fedora silverblue

### Rebasing to rawhide
```
rpm-ostree reset -r
rpm-ostree rebase fedora:fedora/rawhide/x86_64/silverblue -r
```

### Remove packages from base image
```
rpm-ostree override remove firefox
```

### Installing my packages on rpm-ostree
```
sudo rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

rpm-ostree install -r --idempotent \
    VirtualBox \
    mozilla-openh264 \
    tmux \
    neovim \
```
