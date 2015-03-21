#!/bin/bash

if [ "${NEWRELIC_LICENSE}" != "**None**" ]
then
	echo "NewRelic: enabled"
	sed -i "s/newrelic.license = ""/newrelic.license = "${NEWRELIC_LICENSE}"/g" /usr/local/etc/php/conf.d/newrelic.ini

	echo "Setting NewRelic license: ${NEWRELIC_LICENSE}"
	echo "Setting NewRelic appname: ${NEWRELIC_APPNAME}"

	sed -i "s/;newrelic.enabled = true/newrelic.enabled = true/g" /usr/local/etc/php/conf.d/newrelic.ini
	sed -i 's/newrelic.appname = "PHP Application"/newrelic.appname = "${NEWRELIC_APPNAME}"/g' /usr/local/etc/php/conf.d/newrelic.ini

else
	echo "NewRelic: disabled"
fi

exec "$@"
