#! /bin/bash
#
# Diffusion youtube avec ffmpeg

# Configurer youtube avec une résolution 720p. La vidéo n'est pas scalée.

YOUTUBE_URL="rtmp://stream.theusers.live/live"  # URL de base RTMP youtube

SOURCE="$1"              # Source UDP (voir les annonces SAP)
KEY="test"                                     # Clé à récupérer sur l'event youtube

ffmpeg \
    -re \
    -i "$SOURCE" \
    -c copy \
    -f flv "$YOUTUBE_URL/$KEY" \
