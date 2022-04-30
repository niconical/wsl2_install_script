# source list
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp ./aliyun_focal_sources.list  /etc/apt
sudo mv /etc/apt/aliyun_focal_sources.list /etc/apt/sources.list

# wsl2 nameserver tmp
sudo echo 'nameserver:8.8.8.8' >> /etc/reslov.conf
sudo echo 'nameserver:8.8.4.4' >> /etc/reslov.conf

# apt
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install -y zsh
sudo apt install -y autojump
sudo apt install -y fonts-powerline
sudo apt install -y tmux

# github CLI 
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

# export proxy
echo 'export host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")' >> ~/.bashrc
echo 'export HTTP_PROXY=http://$host_ip:7890' >> ~/.bashrc
echo 'export http_proxy=http://$host_ip:7890' >> ~/.bashrc
echo 'export HTTPS_PROXY=http://$host_ip:7890' >> ~/.bashrc
echo 'export https_proxy=http://$host_ip:7890' >> ~/.bashrc

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'prompt_context(){}' >> ~/.zshrc
source ~/.zshrc
