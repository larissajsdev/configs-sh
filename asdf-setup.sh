#!/bin/bash

# verify git instalation
if ! command -v git &> /dev/null; then
    echo "-> installing git..."
    # verify OS
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ "$ID" == "ubuntu" ] || [ "$ID" == "debian" ]; then
            sudo apt update
            sudo apt install -y git
        elif [ "$ID" == "centos" ] || [ "$ID" == "rhel" ]; then
            sudo yum install -y git
        else
            echo "-> operating system not recognized. Install Git manually and run this script again."
            exit 1
        fi
    else
        echo "failed to install git, try again or install manually"
        exit 1
    fi
    if ! command -v git &> /dev/null; then
        echo "-> failed to install git, try again or install manually"
        exit 1
    fi
    echo "-> git successfully installed"
fi

# add asdf dir if not exists
ASDF_DIR="$HOME/.asdf"
if  [ -d "$ASDF_DIR" ]; then
    echo "-> asdf are installed, skip..."
else
    git clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR" --branch v0.13.1
fi

# add asdf in zsh if not exists
if ! grep -q "# asdf config" "$HOME/.zshrc"; then
    echo -e "# asdf config\n\
export ASDF_DIR=\"$ASDF_DIR\"\n\
. \"\$ASDF_DIR/asdf.sh\"\n\
. \"\$ASDF_DIR/completions/asdf.bash\"" >> "$HOME/.zshrc"
    echo "->  configs added to ~/.zshrc."
else
    echo "-> the asdf settings are already present in ~/.zshrc. No changes made."
fi

# start asdf
. "$ASDF_DIR/asdf.sh"

# install latest nodejs
echo "-> installing nodejs.."
asdf plugin-add nodejs
asdf install nodejs 18.18.0
asdf global nodejs 18.18.0

echo "olá"
# exit
echo "-> asdf successfully installed (="
