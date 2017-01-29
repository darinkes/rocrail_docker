# Rocrail in Docker

Rocrail is a non-commercial software for controlling model trains for Linux,
Apple macOS, Raspberry Pi and Windows operating systems. Rocrail assumes all
responsibilities for controlling a model railroad and their accessories.
Trains can be either manually controlled or completely controlled by the
software in automatic mode. A mixed operation, i.e. controlling some trains
manually and other trains in fully automatic mode is possible.

http://www.rocrail.net

## Docker

This Project allows you to build and run a docker container on your raspberry pi
with the rocrail server. The image is based on the released deb Version from:
https://launchpad.net/rocrail/sunrise/2.0

## Build and run
```bash
$ make
$ docker-compose up
```

TCP-Port 8051 is forwarded to the docker container, so you can easily reach
the server with Rocview by entering the IP of your raspberry pi.

The server config can be found in the config directory and is mounted
in the docker container to /config.

## Docker on PI

https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/

## Other Plattforms

The build scripts can be easily adjusted for your plattform, e.g. Linux 32/64 bit.
