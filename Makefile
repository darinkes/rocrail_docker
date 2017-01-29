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
	docker-compose up

run:
	docker run -i -t ${NAME}:${VERSION} /bin/bash
