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

See
---
* Based on [](https://github.com/codeworksio/docker-streaming-server)

* [Open Broadcaster Software post](https://obsproject.com/forum/resources/how-to-set-up-your-own-private-streaming-server-server-using-nginx.50/)
