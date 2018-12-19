#!/bin/bash
# CGRateS Docker (default)

function set_defaults () {
  echo 'Setting Default'
}

echo "Initializing... "
	# set defaults
	set_defaults
	# start services
	service rsyslog start

echo "Starting CGRateS.... "
	cgr-engine

