# rimworld-server
containerization of Rimworld mod Open World Server


Build by hand
```
git clone https://github.com/antimodes201/rimworld-server.git
docker build -t antimodes201/rimworld-server:latest .
```

Docker Pull
```
docker pull antimodes201/rimworld-server
```

Docker Run with defaults
change the volume options to a directory on your node and maybe use a different name then the one in the example

```
docker run -it -p 25555:25555/udp -p 25555:25555 -v /app/docker/temp-vol:/rimworld \
--name rimworld \
antimodes201/rimworld-server:latest
```

The first run of the container will fail as the system must generate Server Settings.txt and World Settings.txt.  Stop the container and edit the configurations as required.  
The server IP will be automatically set based on the containers IP - Server Local IP: 0.0.0.0

For additional configuration details please see the Open World Server documentation: https://github.com/TastyLollipop/OpenWorld

To support Kubernetes and terminal less deployments set the K8 environment variable to True.

```
docker run -it -p 25555:25555/udp -p 25555:25555 -v /app/docker/temp-vol:/rimworld \
-e K8="True" \
--name rimworld \
antimodes201/rimworld-server:latest
```

Currently exposed environmental variables and their default values
- GAME_PORT 25555
- K8 False
- TZ America/New_York

