# rimworld-server
containerization of Rimworld mod Open World Server
Updated antimodes201 code with the update of OpenWorld to 1.4, also optimized for unRAID (because its what I use.)

Build by hand
```
git clone https://github.com/meshuvel/rimworld-server.git
docker build -t meshuvel/rimworld-server:latest .
```

docker run -it -p 25555:25555/udp -p 25555:25555 -v /mnt/cache/appdata/rimworld:/rimworld \
--name rimworld \
meshuvel/rimworld-server:latest
```

The first run of the container will fail as the system must generate Server Settings.txt and World Settings.txt.  Stop the container and edit the configurations as required.  
The server IP will be automatically set based on the containers IP - Server Local IP: 0.0.0.0

For additional configuration details please see the Open World Server documentation: https://github.com/TastyLollipop/OpenWorld

Currently exposed environmental variables and their default values
- GAME_PORT 25555
- K8 False
- TZ America/New_York

