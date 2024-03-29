echo "==> Resetting grub to default"
cp /usr/share/grub/default/grub /etc/default/grub

echo "==> Change GRUB settings"
sed -i -e s/\#GRUB_TERMINAL=.*/GRUB_TERMINAL=console/g /etc/default/grub
sed -i -e s/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=\"text\"/g /etc/default/grub
sed -i -e s/GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX=\"text\"/g /etc/default/grub

echo "==> Update GRUB settings"
update-grub
systemctl set-default multi-user.target

echo "==> Installing Docker"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

apt-get update
apt-get -y install docker-ce

echo "==> Disabling 'sudo' need for docker"
groupadd docker
usermod -aG docker $USER

echo "==> Downloading SSLaunch docker image"
docker pull dkundel/sslaunch

echo "==> Modifying .bashrc"
echo "docker run -it dkundel/sslaunch /bin/bash" >> ~/.bashrc

echo "==> Done. Please restart"