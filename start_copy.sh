#!/bin/bash

killall ffmpeg
nohup ./streamcopy.sh $1 &
ps aux | grep ffmpeg
