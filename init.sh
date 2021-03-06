# change windows host dns setting first!
# e.g. dns: 8.8.8.8/8.8.4.4

# source list
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp ./aliyun_focal_sources.list  /etc/apt
sudo mv /etc/apt/aliyun_focal_sources.list /etc/apt/sources.list

# apt
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install -y zsh
sudo apt install -y autojump
sudo apt install -y fonts-powerline
sudo apt install -y tmux
sudo apt install -y build-essential 

# github CLI 
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

# export proxy
#echo 'export host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")' >> ~/.bashrc
#echo 'export HTTP_PROXY=http://$host_ip:7890' >> ~/.bashrc
#echo 'export http_proxy=http://$host_ip:7890' >> ~/.bashrc
#echo 'export HTTPS_PROXY=http://$host_ip:7890' >> ~/.bashrc
#echo 'export https_proxy=http://$host_ip:7890' >> ~/.bashrc

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'prompt_context(){}' >> ~/.zshrc
echo 'host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")' >> ~/.zshrc
echo 'echo %host_ip' >> ~/.zshrc
echo 'export ALL_PROXY="http://$host_ip:7890"' >> ~/.zshrc
echo 'export all_proxy="http://$host_ip:7890"' >> ~/.zshrc
echo 'curl -I https://www.google.com' >> ~/.zshrc
source ~/.zshrc

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo 'source $HOME/.cargo/env' >> ~/.zshrc

# ref: https://yangchnet.github.io/Dessert/posts/env/wsl2-%E4%B8%8D%E8%BE%93mac%E7%9A%84%E5%BC%80%E5%8F%91%E4%BD%93%E9%AA%8C%E4%BA%8Cwsl2%E7%9A%84%E7%BD%91%E7%BB%9C%E9%97%AE%E9%A2%98/

# WSLg support

sudo apt install net-tools
sudo apt install xrdp -y && sudo systemctl enable xrdp

sudo sed -i "s/^ *PRUNEFS *= *[\"']/&drvfs 9p /" /etc/updatedb.conf

sudo apt install -y tasksel
sudo tasksel install xubuntu-desktop
sudo apt install gtk2-engines


export DISPLAY="$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0"
export LIBGL_ALWAYS_INDIRECT=1
sudo /etc/init.d/dbus start &> /dev/null

sudo touch /etc/sudoers.d/dbus
echo 'cuih ALL = (root) NOPASSWD: /etc/init.d/dbus' >> /etc/sudoers.d/dbus
# then install x-server on windows and allow x-server cross firewall

# node support
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | $SHELL
nvm install --lts


# yarn support
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt install --no-install-recommends yarn

# history time&date
echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> ~/.zshrc
source ~/.zshrc
