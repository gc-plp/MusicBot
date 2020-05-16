#!/bin/bash
set -e

# Set up local pyenv
if [[ ! -d /bot/.pyenv ]]; then
    git clone https://github.com/pyenv/pyenv.git /bot/.pyenv
fi

export PYENV_ROOT="/bot/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source ~/.bashrc

pyenv install -s 3.7.1
pyenv shell 3.7.1

# Get/update bot sources
cd /bot
if [[ ! -d MusicBot ]]; then
    git clone https://github.com/Just-Some-Bots/MusicBot.git
fi

# cd into MusicBot
cd MusicBot
git pull

# Always update stuff on startup
python3 -m pip install -U pip
python3 -m pip install -U -r requirements.txt
./run.sh
