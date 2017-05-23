# SSLaunch Setup Instructions

```
 ███████╗ ███████╗ ██╗       █████╗  ██╗   ██╗ ███╗   ██╗  ██████╗ ██╗  ██╗ 
 ██╔════╝ ██╔════╝ ██║      ██╔══██╗ ██║   ██║ ████╗  ██║ ██╔════╝ ██║  ██║ 
 ███████╗ ███████╗ ██║      ███████║ ██║   ██║ ██╔██╗ ██║ ██║      ███████║ 
 ╚════██║ ╚════██║ ██║      ██╔══██║ ██║   ██║ ██║╚██╗██║ ██║      ██╔══██║ 
 ███████║ ███████║ ███████╗ ██║  ██║ ╚██████╔╝ ██║ ╚████║ ╚██████╗ ██║  ██║ 
 ╚══════╝ ╚══════╝ ╚══════╝ ╚═╝  ╚═╝  ╚═════╝  ╚═╝  ╚═══╝  ╚═════╝ ╚═╝  ╚═╝ 
```

## Setup Automated

### [1. Flash a USB stick with Ubuntu 16.04](https://www.ubuntu.com/download/desktop/create-a-usb-stick-on-macos)

### 2. Install Ubuntu 16.04 from USB stick

### 3. Open terminal and run script

```bash
sudo apt-get -y install apt-transport-https ca-certificates curl

curl -fsSL https://rawgit.com/dkundel/sslaunch/master/install-sslaunch.sh | sudo bash -
```

### 4. Reboot

## Setup Manual

### [1. Flash a USB stick with Ubuntu 16.04](https://www.ubuntu.com/download/desktop/create-a-usb-stick-on-macos)

### 2. Install Ubuntu 16.04 from USB stick

### 3. Configure boot to terminal

```bash
sudo cp /usr/share/grub/default/grub /etc/default/grub
sudo nano /etc/default/grub
```

Set/Uncomment the following values in the file

```
GRUB_CMDLINE_LINUX_DEFAULT="text"
GRUB_CMDLINE_LINUX="text"
GRUB_TERMINAL=console
```

Run the following commands:

```
sudo update-grub
sudo systemctl set-default multi-user.target
sudo reboot
```

### 4. Install `docker`

```bash
sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

sudo apt-get update
sudo apt-get -y install docker-ce
```

### 5. Disable `sudo` for docker

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
```

Log out by typing `exit` and then log back in

### 6. Test `docker`

```bash
docker run hello-world
```

### 7. Test `SSLaunch` image

```bash
docker run -it dkundel/sslaunch /bin/bash
```

### 8. Modify `.bashrc`

```bash
echo "docker run -it dkundel/sslaunch /bin/bash" >> ~/.bashrc
```

### 9. Test by rebooting

Exit the Docker container by writing `exit` then `sudo reboot`

# License

MIT

# Contributors

- Dominik Kundel <dkundel@twilio.com>