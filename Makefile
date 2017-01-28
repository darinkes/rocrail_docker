NAME=		rocrail
VERSION=	0.1-`git log --pretty=format:'%h' -n 1`

all: Dockerfile
	docker build -t ${NAME}:${VERSION} .

run:
	docker run -i -t ${NAME}:${VERSION} /bin/bash
