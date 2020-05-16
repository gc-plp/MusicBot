#!/bin/bash
docker run -v musicbot:/bot gcplp/musicbot:latest

# With an options.ini and autoplaylist.txt file prepared, run:
docker run \
    -v musicbot:/bot \
    -v $(pwd)/options.ini:/bot/MusicBot/config/options.ini \
    -v $(pwd)/autoplaylist.txt:/bot/MusicBot/config/autoplaylist.txt \
    gcplp/musicbot:latest
