Develop
-------

1. `docker-compose up streaming-consumer streaming-server`

2. Use [Open Broadcaster Software](https://obsproject.com/) to stream your content

    * Add media source `Sources` > `+` > `Video Capture Device`
    * Configure streaming server `Controls` > `Settings` > `Stream`
        - Stream type: `Custom Streaming Server`
        - URL: `rtmp://localhost/live`
        - Stream key: `test`
    * Press `Start Streaming` button

3. Go to `http://localhost:9999` URL address in your browser to view the media live.

4. Edit Website in `www/`

Deploy
------

````
apt update -y && apt upgrade -y
apt install docker.io  docker-compose git -y
git pull <THIS_REPO>
cd <THIS_REPO>
# check domains in docker-compose.yml and connect server with DNS
docker-compose up
````

Use
---

### Workflow 1

Stream directly from OBS:
````
URL: https://stream.theusers.live/live
key: test
````

### Workflow 2
Stream uploaded file from server
````
1. upload file via ftp
2. start stream: $ ./start_video videos/myvideo.mp4
````

### Workflow 3
Stream uploaded file from server, but convert first. This saves a lot of CPU because transcoding happens before broadcast.
````
1. upload file via ftp
2. convert: $ ./convert.sh videos/myvideo.mp4 videos/myvideo.flv
3. start stream: $ start_copy.sh videos/myvideo.flv
````

### INFO: Shell files
* ./stream.sh - stream file and transcode on the fly
* ./stramcopy.sh - stream file by copying it, do not transcode
* ./start_video.sh - ./stream.sh but with nohup so it's save to log out white stream is running
* ./start_copy - ./stream_copy.sh but with nohup so it's save to log out white stream is running
* ./stop_video - stop any running ffmpeg streams

TODO
----

* change stream key
* put critical variables in .env and create env-example
  * (s)ftp password
  * stream password (so other point in this list)
* secure stream
  * https://smartshitter.com/musings/2017/12/nginx-rtmp-streaming-with-simple-authentication/
  * https://smartshitter.com/musings/2018/06/nginx-rtmp-streaming-with-slightly-improved-authentication/
* use sftp instead of ftp: https://hub.docker.com/r/atmoz/sftp/ (almost same options and syntax)
* copy www content to the (s)ftp folder so it's more easy to edit
* connect to cyborgmaster...

See
---
* Based on [](https://github.com/codeworksio/docker-streaming-server)

* [Open Broadcaster Software post](https://obsproject.com/forum/resources/how-to-set-up-your-own-private-streaming-server-server-using-nginx.50/)
