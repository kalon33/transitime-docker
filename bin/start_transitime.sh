#!/usr/bin/env bash
export PGPASSWORD=transitime
echo "hibernate.connection.url=jdbc:postgresql://$POSTGRES_PORT_5432_TCP_ADDR:$POSTGRES_PORT_5432_TCP_PORT/stif" >> /usr/local/transitime/transitime.properties
/usr/local/tomcat/bin/startup.sh
java -Xmx3G\
    -Dtransitime.hibernate.configFile=/usr/local/transitime/hibernate.cfg.xml \
    -Dhibernate.connection.url=jdbc:postgresql://$POSTGRES_PORT_5432_TCP_ADDR:$POSTGRES_PORT_5432_TCP_PORT/stif \
    -Dhibernate.connection.username=postgres \
    -Dhibernate.connection.password=$PGPASSWORD \
    -Dtransitime.avl.gtfsRealtimeFeedURI="https://stif.spiralo.net/STIF" \
    -Dtransitime.modules.optionalModulesList=org.transitime.avl.GtfsRealtimeModule \
    -Dtransitime.core.agencyId=stif \
    -cp /usr/local/transitime/transitime.jar \
	org.transitime.applications.Core

