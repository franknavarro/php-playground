#!/bin/bash

# Common variables.
PROJECT_DIRECTORY="$(cd -- "$(dirname "$0")/.."; pwd -P)"
DOCKER_COMPOSE_WORDPRESS="-f $PROJECT_DIRECTORY/docker/wordpress.yml"
# These are the containers and values for the WordPress test site.
WORDPRESS_CLI='cli-fun'
WORDPRESS_CONTAINER='wordpress-fun'
WORDPRESS_SITE_TITLE='PHP FUN'
WORDPRESS_ADMIN_USER='admin'
WORDPRESS_ADMIN_PASSWORD='password'

# TTY compatibility.
# For some environments, a TTY may not be available (e.g. GitHub Actions).
# Docker Compose allocates a TTY by default, so it's important that we disable it
# automatically when needed.
if [ -t 0 ]; then
	COMPOSE_EXEC_ARGS=""
else
	COMPOSE_EXEC_ARGS="-T" # Disable pseudo-tty allocation. By default `docker compose exec` allocates a TTY.
fi

##
# Add status message formatting to a string, and echo it.
#
# @param {string} message The string to add formatting to.
##
status_message() {
	echo -e "\033[0;36mSTATUS\033[0m: $1"
}

##
# Add formatting to an action string.
#
# @param {string} message The string to add formatting to.
##
action_format() {
	echo -en "\033[32m$1\033[0m"
}

##
# Docker Compose helper
#
# Calls `docker compose` with common options for wordpress.
##
dc-wordpress() {
	docker compose $DOCKER_COMPOSE_WORDPRESS "$@"
}

##
# WP CLI
#
# Executes a WP CLI request in the CLI container.
##
wp() {
	dc-wordpress exec $COMPOSE_EXEC_ARGS $WORDPRESS_CLI wp "$@"
}
