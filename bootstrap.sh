set -e
set -u

set +e
DOT_VERSION="0.1.15"
OSX_VERSION=$(sw_vers -productVersion | awk -F "." '{print $2}')

# show the banner and wait for a response
printf "%s" $'\e[1;32m
       ___       ___          ___          ___                   ___
      /  /\     /__/\        /  /\        /  /\         ___     /  /\
     /  /::\    \  \:\      /  /:/_      /  /:/_       /  /\   /  /::\
    /  /:/\:\    \  \:\    /  /:/ /\    /  /:/ /\     /  /:/  /  /:/\:\
   /  /:/~/:/_____\__\:\  /  /:/_/::\  /  /:/ /::\   /  /:/  /  /:/~/:/
  /__/:/ /://__/::::::::\/__/:/__\/\:\/__/:/ /:/\:\ /  /::\ /__/:/ /:/___
  \  \:\/:/ \  \:\~~\~~\/\  \:\ /~~/:/\  \:\/:/~/://__/:/\:\\  \:\/:::::/
   \  \::/   \  \:\  ~~~  \  \:\  /:/  \  \::/ /:/ \__\/  \:\\  \::/~~~~
    \  \:\    \  \:\       \  \:\/:/    \__\/ /:/       \  \:\\  \:\
     \  \:\    \  \:\       \  \::/       /__/:/         \__\/ \  \:\
      \__\/     \__\/        \__\/        \__\/                 \__\/\e[1;31m
  Version 0.2.0
\e[0m
  TODO: Add startup message here...
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

--> Making sure /opt/dotfiles exists and belongs to you."

sudo mkdir -p /opt/dotfiles
sudo chown $USER:staff /opt/dotfiles

if [ ! -d "/opt/" ]; then
  echo ""
  sudo mkdir -p /opt/dotfiles
  install_dotfiles
  sudo chown ${USER}:staff /opt/dotfiles
else
  install_dotfiles
  sudo chown ${USER}:staff /opt/dotfiles
fi