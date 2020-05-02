#! /bin/bash

# Configurer youtube avec une résolution 720p. La vidéo n'est pas scalée.

VBR="1600k"                                    # Bitrate de la vidéo en sortie
FPS="30"                                       # FPS de la vidéo en sortie
QUAL="fast"                                    # Preset de qualité FFMPEG

ffmpeg -i "$1" -c:v libx264 -preset $QUAL -b:v $VBR -maxrate $VBR -bufsize 6000k \
-vf "scale=1280:-1,format=yuv420p" -g $(($FPS * 2)) -c:a aac -b:a 128k -ac 2 -ar 44100 "$2"