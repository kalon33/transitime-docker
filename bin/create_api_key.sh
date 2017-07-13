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
	org.transitime.applications.CreateAPIKey \
	-d "foo" \
	-e "nathan@rylath.net" \
	-n "Nathan Walker" \
	-p "123" \
	-u "http://foo.bar.com"

