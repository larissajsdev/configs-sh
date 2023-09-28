#!/bin/bash
# install asdf
ASDF_DIR="$HOME/.asdf"
if [ -d "$ASDF_DIR" ]; then
    echo "-> asdf are installed, skip..."
else
    git clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR" --branch v0.13.1

    # add asdf in zsh if not exists
    if ! grep -q "# asdf config" "$HOME/.zshrc"; then
        echo -e "# asdf config\n\
export ASDF_DIR=\"$ASDF_DIR\"\n\
. \"\$ASDF_DIR/asdf.sh\"\n\
. \"\$ASDF_DIR/completions/asdf.bash\"" >>"$HOME/.zshrc"
        echo "->  configs added to ~/.zshrc."
    else
        echo "-> the asdf settings are already present in ~/.zshrc. No changes made."
    fi
fi

. "$ASDF_DIR/asdf.sh"

echo "-> asdf successfully installed (="
