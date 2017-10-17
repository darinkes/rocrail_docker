NAME=		rocrail
VERSION=	12840
DEBFILE=	rocrail-${VERSION}-linuxarmhf-wx3.0-armhf.deb
CODENAME!=	lsb_release -sc
DEBFILE=	rocrail-${VERSION}-${CODENAME}-wx3.0-armhf.deb

all: ${DEBFILE} rocrail_${VERSION}_deb Dockerfile
	sudo docker build --build-arg version=${VERSION} -t ${NAME}:${VERSION} .

${DEBFILE}:
	wget https://launchpad.net/rocrail/sunrise/2.0/+download/${DEBFILE}

rocrail_${VERSION}_deb:
	rm -rf rocrail_${VERSION}_deb
	dpkg -x ${DEBFILE} rocrail_${VERSION}_deb

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
