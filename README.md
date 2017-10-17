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
$ docker-compose up -d
Recreating rocraildocker_rocrail_1...
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
e4756aa6bdd9        rocrail:11903       "/usr/bin/entry.sh..."   19 seconds ago      Up 16 seconds       0.0.0.0:8051->8051/tcp   rocraildocker_rocrail_1
$ docker attach --sig-proxy=false rocraildocker_rocrail_1
20171017.154537.693 r9999c cmdr7620 ODCC232  0143 Power OFF
20171017.154537.694 r9999I cmdr7620 OSerial  0222 open rc=1 read=-1 write=-1 [1] [Operation not permitted]
20171017.154537.697 r9999I cmdr7620 OModel   2465 informing 3 listeners of a system event name=sys val=stop...
....
<CTRL-C>
```

TCP-Port 8051 is forwarded to the docker container, so you can easily reach
the server with Rocview by entering the IP of your raspberry pi.

The server config can be found in the config directory and is mounted
in the docker container to /config.

In my Train Setup I use an DCC232 Interface so ttyUSB0 is passed to the
rocrail docker container.

## Docker on PI

https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/

## Other Plattforms

The build scripts can be easily adjusted for your plattform, e.g. Linux 32/64 bit.
