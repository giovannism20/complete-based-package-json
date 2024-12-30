#!/bin/bash

REPO_URL="git@github.com:giovannism20/complete-based-package-json.git"
INSTALL_DIR="/opt/complete-based-package-json"
AUTOCOMPLETE_SCRIPT="$INSTALL_DIR/autocomplete.sh"

if [ ! -d "$INSTALL_DIR" ]; then
    echo "Cloning the repository..."
    git clone "$REPO_URL" ~/complete-based-package-json
    sudo cp -r ~/complete-based-package-json /opt/
else
    echo "Repository already exists at $INSTALL_DIR."
fi

chmod +x "$AUTOCOMPLETE_SCRIPT"

if [ -f ~/.bashrc ]; then
    echo "Updating .bashrc..."
    if ! grep -q "source $AUTOCOMPLETE_SCRIPT" ~/.bashrc; then
        echo "source $AUTOCOMPLETE_SCRIPT" >> ~/.bashrc
        echo "Line 'source $AUTOCOMPLETE_SCRIPT' added to .bashrc."
    else
        echo "The line is already present in .bashrc."
    fi
    source ~/.bashrc
elif [ -f ~/.zshrc ]; then
    echo "Updating .zshrc..."
    if ! grep -q "source $AUTOCOMPLETE_SCRIPT" ~/.zshrc; then
        echo "source $AUTOCOMPLETE_SCRIPT" >> ~/.zshrc
        echo "Line 'source $AUTOCOMPLETE_SCRIPT' added to .zshrc."
    else
        echo "The line is already present in .zshrc."
    fi
    source ~/.zshrc
else
    echo "No shell configuration file found (.bashrc or .zshrc)."
    echo "Please manually add 'source $AUTOCOMPLETE_SCRIPT' to your shell configuration file."
    exit 1
fi

if ! command -v jq &> /dev/null; then
    echo "'jq' is not installed. Installing..."

    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO_NAME=$ID
        DISTRO_VERSION=$VERSION_ID

        case "$DISTRO_NAME" in
            debian|ubuntu|linuxmint)
                echo "Debian-based distribution detected. Installing jq with apt..."
                sudo apt update && sudo apt install jq -y
                ;;
            fedora|centos|rhel)
                echo "Red Hat-based distribution detected. Installing jq with dnf..."
                sudo dnf install jq -y
                ;;
            arch|manjaro)
                echo "Arch-based distribution detected. Installing jq with pacman..."
                sudo pacman -S jq --noconfirm
                ;;
            *)
                echo "Unsupported distribution detected. Please install 'jq' manually."
                echo "For example: sudo apt install jq (Debian-based), sudo dnf install jq (Red Hat-based), or sudo pacman -S jq (Arch-based)."
                exit 1
                ;;
        esac
    else
        echo "Unable to detect the distribution. Please install 'jq' manually."
        exit 1
    fi

else
    echo "'jq' is already installed."
fi


echo "Autocomplete successfully installed!"
