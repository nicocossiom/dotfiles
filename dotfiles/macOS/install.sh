#! /bin/bash

## TODO - add command to readme that downloads the dotfiles repo and launches this program
## default curl is in /usr/bin/curl 
# Install Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

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

echo "Done installing GUI-applications, open and configure each of them manually."

# install CLI-apps/tools through Homebrew
echo "Installing CLI-apps/tools through Homebrew..."
brew install git
brew install curl
brew install wget
brew install lsd
echo "alias ls=lsd" >>~/.config/fish/config.fish
echo "Installing fish shell..."
brew install fish
echo "Installing fisher"
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
echo "Installing fisher plugins..."
fisher install jorgebucaran/nvm.fish
fisher install IlanCosman/tide@v5
echo "Launching fish shell to configure fish prompt with tide"
/opt/homebrew/bin/fish -c "tide configure"

echo "Installing JDKs: latest, 11, 8..."
brew install openjdk
brew install openjdk@11
brew install openjdk@8
echo "Installing Maven and jenv..."
brew install maven
brew install jenv
echo "Adding JDKs to jenv..."
JDK_DIRECTORIES=($(ls -d1 /opt/homebrew/Cellar/openjdk*/*/libexec/openjdk.jdk/Contents/Home/))
for JDK_DIR in "${JDK_DIRECTORIES[@]}"; do
    jenv add "$JDK_DIR"
done
DONE_SELECTING_JDK=false
while [ "$DONE_SELECTING_JDK" = false ]; do
    echo "Select your preferred global JDK, if you do not whish to do so now, press enter."
    select filename in $(jenv versions); do
        if [ -z "$filename" ]; then
            DONE_SELECTING_JDK=true
            break
        else
            echo "you selected $filename"
            echo "are you sure? (y/n))"
            read answer
            if [ "$answer" = "y" ]; then
                jenv global "$filename"
                DONE_SELECTING_JDK=true
                break
            fi
            break
        fi
    done
done
echo "Installing python tools, will use Conda to manage python versions"
brew install --cask anaconda

echo "Installing JS tools (node, bun, deno)"
brew install node
brew install bun
brew install deno
brew install yarn

echo "Installing databases"
brew install postgresql
brew install redis
brew install mongodb-community
brew install mysql
brew install sqlite3

# install MacAppStore apps through mas-cli
echo "Installing MacAppStore apps through mas-cli..."
brew install mas
mas install 360593530  # Notabilty
mas install 1444383602 # GoodNotes 5
mas install 1388020431 # DevCleaner for Xcode
mas install 640199958  # Apple Developer
echo "Installing Xcode..."
mas install 497799835 # Xcode
echo "Installing Xcode command line tools..."
xcode-select --install

# install fonts
echo "Installing fonts..."
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install --cask font-fira-code
brew install --cask font-iosevka
echo "The Font Book app will open now, please install the following fonts manually."
open ./fonts/DankMonoRegular.otf
open ./fonts/DankMonoItalic.otf

# change default shell to fish
echo "Making fish shell the default shell..."
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish




