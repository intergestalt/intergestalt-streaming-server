#!/bin/bash

#killall ffmpeg
nohup ./stream2.sh "$1" &
ps aux | grep ffmpeg
