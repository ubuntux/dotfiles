set -e
set -u

set +e
DOT_VERSION="wip-0.2.0"
OSX_VERSION=$(sw_vers -productVersion | awk -F "." '{print $2}')

# show the banner and wait for a response
printf "%s" $'\e[1;32m
    ██████╗  ██████╗ ███╗   ██╗ ██████╗ ███████╗████████╗██████╗
    ██╔══██╗██╔═══██╗████╗  ██║██╔════╝ ██╔════╝╚══██╔══╝██╔══██╗
    ██████╔╝██║   ██║██╔██╗ ██║██║  ███╗███████╗   ██║   ██████╔╝
    ██╔═══╝ ██║   ██║██║╚██╗██║██║   ██║╚════██║   ██║   ██╔══██╗
    ██║     ╚██████╔╝██║ ╚████║╚██████╔╝███████║   ██║   ██║  ██║
    ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝\e[1;31m
                                                    version 0.2.0
\e[0;1m
  Welcome to Pongstr Dotfiles, we\'re now going to setup your Mac, it might take
  a while but it will be awesome once completed. These are some of the the apps
  and tools that we\'re going to install: \n
  \t- RVM and the latest version of Ruby
  \t- Atom
  \t- Dnsmasq
  \t- Homebrew
  \t- MongoDB
  \t- MySql
  \t- Nginx
  \t- Nodenv (with node-build plugin)
  \t- Nodejs (v0.12.7 and 4.0.0)
  \t- Sublime Text 3
  \t- Vim (Overrides the system\'s default)
  \t- Zsh (with Oh-my-zsh Plugin)
\e[0;1m
  Ready to get started? Hit a key with your favorite finger.\e[0m'
read -n 1 -s


echo "

--> TODO: Add password prompt message here..."
sudo -p "    Password for sudo: " echo "    Sweet, thanks. I'll see you in Vegas, sucker."


install_dotfiles () {
  echo "

--> Download and Install Dotfiles"
  sudo curl -# -L -O https://github.com/pongstr/dotfiles/archive/${DOT_VERSION}.tar.gz
  sudo tar -xzf ${DOT_VERSION}.tar.gz --strip=1 -C /opt/dotfiles && rm -rf ${DOT_VERSION}.tar.gz
}

echo "
--> Installing dotfiles on ${OSX_VERSION}
--> Making sure /opt/dotfiles exists and belongs to you."

sudo mkdir -p /opt/dotfiles
sudo chown $USER:staff /opt/dotfiles

if [ ! -d "/opt/" ]; then
  echo ""
  sudo mkdir -p /opt/dotfiles
  install_dotfiles
  sudo chown ${USER}:staff /opt/dotfiles
else
  sudo rm -rf /opt/dotfiles/*
  install_dotfiles
  sudo chown ${USER}:staff /opt/dotfiles
fi

if rvm 2>/dev/null ]; then
  echo "

  --> Installing Ruby Version Manager and Ruby Latest"
  \curl -sSL https://get.rvm.io | bash -s stable

  sleep 1
  source ${HOME}/.profile

  sleep 1
  echo "

  --> Updating OSX SSL Certificates"
  rvm osx-ssl-certs update all

  echo "
  --> Add auto update SSL Certificate"
  rvm osx-ssl-certs cron install
  rvm reload
else
  rvm --version
fi
