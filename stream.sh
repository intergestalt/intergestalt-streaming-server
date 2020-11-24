#! /bin/bash
#
# Diffusion youtube avec ffmpeg

# Configurer youtube avec une résolution 720p. La vidéo n'est pas scalée.

VBR="1600k"                                    # Bitrate de la vidéo en sortie
FPS="30"                                       # FPS de la vidéo en sortie
QUAL="fast"                                    # Preset de qualité FFMPEG
YOUTUBE_URL="rtmp://rec.stream.intergestalt.cloud/live"  # URL de base RTMP youtube

SOURCE="$1"              # Source UDP (voir les annonces SAP)
KEY="test"                                     # Clé à récupérer sur l'event youtube

ffmpeg \
    -re \
    -i "$SOURCE" -deinterlace \
    -c:v libx264 -preset $QUAL -b:v $VBR -maxrate $VBR -bufsize 6000k -pix_fmt yuv420p -g $(($FPS * 2)) \
    -c:a aac -b:a 160k -ac 2 -ar 44100 \
    -f flv "$YOUTUBE_URL/$KEY" \
    #out.flv
