# source list
mv /etc/apt/sources.list /etc/apt/sources.list.bak
cp ./aliyun_focal_sources.list  /etc/apt
mv /etc/apt/aliyun_focal_sources.list /etc/apt/sources.list

# wsl2 nameserver tmp
echo 'nameserver:8.8.8.8' >> /etc/reslov.conf
echo 'nameserver:8.8.4.4' >> /etc/reslov.conf

# apt
apt update
apt upgrade -y
apt autoremove -y
apt install -y zsh
apt install -y autojump
apt install -y fonts-powerline
apt install -y tmux


# export proxy
echo 'export host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")' >> /home/cuih/.bashrc
echo 'export HTTP_PROXY=http://$host_ip:7890' >> /home/cuih/.bashrc
echo 'export http_proxy=http://$host_ip:7890' >> /home/cuih/.bashrc
echo 'export HTTPS_PROXY=http://$host_ip:7890' >> /home/cuih/.bashrc
echo 'export https_proxy=http://$host_ip:7890' >> /home/cuih/.bashrc

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'prompt_context(){}' >> ~/.zshrc
source ~/.zshrc
