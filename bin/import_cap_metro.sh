#!/usr/bin/env bash
export PGPASSWORD=transitime
java \
	-Dtransitime.db.dbName=stif \
	-Dtransitime.db.dbType=postgresql \
	-Dtransitime.db.dbUserName=postgres \
	-Dtransitime.db.dbPassword=$PGPASSWORD \
	-Dtransitime.core.agencyId=stif \
	-Dtransitime.hibernate.configFile=/usr/local/transitime/hibernate.cfg.xml \
	-Dhibernate.connection.url=jdbc:postgresql://$POSTGRES_PORT_5432_TCP_ADDR:$POSTGRES_PORT_5432_TCP_PORT/stif \
	-Dhibernate.connection.username=postgres \
	-Dhibernate.connection.password=$PGPASSWORD \
	-cp /usr/local/transitime/transitime.jar \
	org.transitime.applications.GtfsFileProcessor \
	-gtfsUrl "http://ratp.spiralo.net/stif_gtfs_enhanced_rer_latest.zip"

psql \
	-h "$POSTGRES_PORT_5432_TCP_ADDR" \
	-p "$POSTGRES_PORT_5432_TCP_PORT" \
	-U postgres \
	-d stif \
	-c "update activerevisions set configrev=0 where configrev = -1; update activerevisions set traveltimesrev=0 where traveltimesrev = -1;"

