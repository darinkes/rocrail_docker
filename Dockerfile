FROM resin/rpi-raspbian
MAINTAINER stefan.rinkes@gmail.com
ARG version

ADD rocrail_${version}_deb/opt/rocrail/rocrail /opt/rocrail/rocrail
ADD rocrail_${version}_deb/opt/rocrail/*.so /opt/rocrail/

CMD cd /opt/rocrail && /opt/rocrail/rocrail -nodevcheck -w $WORKDIR -l /opt/rocrail/ -img /opt/rocrail/
