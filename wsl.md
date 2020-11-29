# WSL setup Ubuntu 20.04 for toolbox

## Vpnkit
requires docker desktop with wsl integration.

```
sudo apt install genisoimage unzip socat

isoinfo -i /mnt/c/Program\ Files/Docker/Docker/resources/wsl/docker-for-wsl.iso -R -x /containers/services/vpnkit-tap-vsockd/lower/sbin/vpnkit-tap-vsockd > ./vpnkit-tap-vsockd
chmod +x vpnkit-tap-vsockd
sudo mv vpnkit-tap-vsockd /sbin/vpnkit-tap-vsockd
sudo chown root:root /sbin/vpnkit-tap-vsockd

wget https://github.com/jstarks/npiperelay/releases/download/v0.1.0/npiperelay_windows_amd64.zip
unzip npiperelay_windows_amd64.zip npiperelay.exe
rm npiperelay_windows_amd64.zip
mkdir /mnt/c/bin
mv npiperelay.exe /mnt/c/bin/
sudo ln -s /mnt/c/bin/npiperelay.exe /usr/local/bin/npiperelay.exe

sudo tee /etc/wsl.conf <<EOL
[network]
generateResolvConf = false
EOL

sudo tee /etc/resolv.conf <<EOL
nameserver 1.1.1.1
EOL

sudo wget https://raw.githubusercontent.com/sakai135/wsl-vpnkit/main/wsl-vpnkit -C /sbin/wsl-vpnkit
sudo chmod +x /sbin/wsl-vpnkit
```

Run with:
```
sudo --preserve-env=WSL_INTEROP wsl-vpnkit
```


## Podman

### Install
```
source /etc/os-release
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"
wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_${VERSION_ID}/Release.key -O- | sudo apt-key add -
sudo apt-get update -qq
sudo apt-get -qq --yes install podman
```


## Systemd

### Systemd Genie
https://github.com/arkane-systems/genie

### Requirements
```
sudo apt install daemonize dbus policykit-1 systemd
```

#### Dotnet runtime 3.1
```
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo apt install ./packages-microsoft-prod.deb
rm ./packages-microsoft-prod.deb
sudo apt update
sudo apt install dotnet-runtime-3.1
```

### Install
```
sudo bash -c 'echo "deb [trusted=yes] https://wsl-translinux.arkane-systems.net/apt/ /" > /etc/apt/sources.list.d/wsl-translinux.list'
sudo apt update
sudo apt install systemd-genie
```

### Run
```
genie -i
```
start new terminal.


## Toolbox 
### Requirements
```
sudo apt install meson bash-completion flatpak
sudo mkdir /toolbox
sudo chown $USER /toolbox
```

### TODO: install flatpak-sessionhelper somehow
