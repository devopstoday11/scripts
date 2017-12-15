#!/bin/sh

exec /usr/share/ib-tws/jre/bin/java -cp /usr/share/ib-tws/jars/\*:/usr/share/java/ibcontroller/ibcontroller.jar  -Xmx512M ibcontroller.IBGatewayController ~/Jts/ib-controller.ini
