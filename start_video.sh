#!/bin/bash

killall ffmpeg
nohup ./stream.sh $1 &
ps aux | grep ffmpeg
