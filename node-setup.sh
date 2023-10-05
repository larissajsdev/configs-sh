#!/bin/bash
# install nodejs 18
echo "-> installing nodejs.."
asdf plugin-add nodejs
asdf install nodejs 18.18.0
asdf global nodejs 18.18.0
npm install -g pnpm
