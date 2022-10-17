#! /bin/bash

## TODO - add command to readme that downloads the dotfiles repo and launches this program
## default curl is in /usr/bin/curl
# Install Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo '# Set PATH, MANPATH, etc., for Homebrew.' >>/Users/pepperonico/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/pepperonico/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install GUI-applications through Homebrew
echo "Installing GUI-applications through Homebrew..."
brew install --cask visual-studio-code
brew install --cask jetbrains-toolbox
brew install firefox
brew install --cask google-chrome
brew install --cask iterm2
brew install spotify
brew install --cask slack
brew install --cask discord
brew install --cask zoom
brew install --cask docker
brew install --cask postman
brew install --cask vlc
brew install --cask notion
brew install --cask obs
brew install --cask logi-options-plus
brew install bitwarden
brew install --cask microsoft-teams
brew install --cask microsoft-office
brew install --cask whatsapp
brew install --cask telegram
brew install --cask setapp
brew install --cask raycast
brew install --cask alt-tab
brew install --cask thunderbird
brew install onedrive
brew install libreoffice
brew install libreoffice-language-pack
brew install --cask cakebrew
brew install --cask obsidian
brew install --cask nextcloud
brew install mos

~/.config/fish/config.fishecho "Done installing GUI-applications, open and configure each of them manually."

# install CLI-apps/tools through Homebrew
echo "Installing CLI-apps/tools through Homebrew..."
brew install git
brew install curl
brew install wget
brew install lsd
echo "Installing fish shell..."
brew install fish
echo "alias ls=lsd" >>~/.config/fish/config.fish
/opt/homebrew/bin/fish -c "fish_add_path /opt/homebrew/bin"
/opt/homebrew/bin/fish -c "fisher install IlanCosman/tide@v5"
echo "Installing fisher"
brew install fisher
echo "Installing fisher plugins..."
/opt/homebrew/bin/fish -c "fisher install jorgebucaran/nvm.fish"
/opt/homebrew/bin/fish -c "fisher install IlanCosman/tide@v5"
echo "Launching fish shell to configure fish prompt with tide"
/opt/homebrew/bin/fish -c "tide configure"
echo "Adding paths to fish..."
/opt/homebrew/bin/fish -c "fish_add_path /opt/homebrew/bin"
echo "Installing SDKMan for sdk management(java), visit https://sdkman.io"
/opt/homebrew/bin/fish -c "fisher install reitzig/sdkman-for-fish@v1.4.0"
echo "Installing JDKs through sdkman: latest, 11, 8..."
/opt/homebrew/bin/fish -c "sdk install java 8.0.345-zulu"
/opt/homebrew/bin/fish -c "sdk install java 11.0.16.1-zulu"
/opt/homebrew/bin/fish -c "sdk install java 19-zulu"

echo "Installing CMake and other C/C++ tools"
brew install cmake
brew install cmake-docs
brew install ninja

echo "Installing rust"
brew install rust

echo "Installing Maven and jenv..."
brew install maven

echo "Installing python tools, will use Conda to manage python versions"
brew install --cask anaconda
/opt/homebrew/bin/fish -c "fish_add_path /opt/homebrew/anaconda3/bin"

echo "Installing JS tools (node, bun, deno, yarn)"
brew install node
curl https://bun.sh/install | bash
brew install deno
brew install yarn

echo "Installing databases (postgresql, mysql, sqlite3)"
brew install postgresql
brew install mysql
brew install sqlite3

# install MacAppStore apps through mas-cli
echo "Installing MacAppStore apps through mas-cli..."
echo "Installing mas..."
brew install mas
# Notabilty
echo "Installing Notabilty..."
mas install 360593530
# GoodNotes 5
echo "Installing GoodNotes 5..."
mas install 1444383602
# DevCleaner for Xcode
echo "Installing DevCleaner for Xcode..."
mas install 1388020431
echo "Installing Apple Developer"
# Apple Developer
mas install 640199958
echo "Installing Xcode..."
# Xcode
mas install 497799835
echo "Installing Xcode command line tools..."
xcode-select --install

# install fonts
echo "Installing fonts..."
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install --cask font-fira-code-nerd-font
brew install --cask font-iosevka
echo "The Font Book app will open now, please install the following fonts manually."
open ./fonts/DankMonoRegular.otf
open ./fonts/DankMonoItalic.otf

# change default shell to fish
echo "Making fish shell the default shell..."
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

# create an ssh key
echo "Setting up ssh keys"
mkdir ~/.ssh
cd ~/.ssh || exit
echo "Downloading and installing fish_ssh_agent"
wget https://gitlab.com/kyb/fish_ssh_agent/raw/master/functions/fish_ssh_agent.fish -P ~/.config/fish/functions/
echo "fish_ssh_agent" >>~/.config/fish/config.fish
touch ~/.ssh/config
echo "Creating ssh key, input nicocossiom as the file name for the key which is about to be generated"
ssh-keygen -t ed25519 -C "nicocossiom@gmail.com"
echo -e "AddKeysToAgent yes\nHost *\nAddKeysToAgent yes\nUseKeychain yes\nIdentityFile ~/.ssh/nicocossiom" >>~/.ssh/config
ssh-add ~/.ssh/nicocossiom
