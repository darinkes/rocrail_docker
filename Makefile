NAME=		rocrail
VERSION=	11903
DEBFILE=	rocrail-${VERSION}-linuxarmhf-wx3.0-armhf.deb

all: ${DEBFILE} rocrail_deb Dockerfile
	sudo docker build -t ${NAME}:${VERSION} .

${DEBFILE}:
	wget https://launchpad.net/rocrail/sunrise/2.0/+download/${DEBFILE}

rocrail_deb:
	dpkg -x ${DEBFILE} rocrail_deb

compose:
	mkdir -p config/abox
	docker-compose up

start:
	sudo docker run --device=/dev/ttyUSB0 \
	    -v $(shell pwd)/config:/config \
	    -p 8051:8051 \
	    --env "WORKDIR=/config" \
	    ${NAME}:${VERSION}

run:
	docker run -i -t ${NAME}:${VERSION} /bin/bash
