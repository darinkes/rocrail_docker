FROM resin/rpi-raspbian
MAINTAINER stefan.rinkes@gmail.com

ADD rocrail_deb/opt/rocrail/rocrail /opt/rocrail/rocrail
ADD rocrail_deb/opt/rocrail/*.so /opt/rocrail/

CMD cd /opt/rocrail && /opt/rocrail/rocrail -nodevcheck -w $WORKDIR -l /opt/rocrail/ -img /opt/rocrail/
