#!/bin/bash

# Exit if any command fails.
set -e

# Include useful functions
. "$(dirname "$0")/includes.sh"

# Install library into test WordPress plugin
status_message "Initializing WordPress plugin..."
rm -rf "${PROJECT_DIRECTORY}/examples/wordpress-plugin/vendor"
cd "${PROJECT_DIRECTORY}/examples/wordpress-plugin"
composer install

# Go back to project directory
cd $PROJECT_DIRECTORY

# Stop existing containers.
status_message "Stopping Docker containers..."
dc-wordpress down --remove-orphans

# Launch the containers.
status_message "Starting Docker containers..."
dc-wordpress up -d

WORDPRESS_HOST_PORT=$(dc-wordpress port $WORDPRESS_CONTAINER 80 | awk -F : '{printf $2}')
WORDPRESS_URL="http://localhost:$WORDPRESS_HOST_PORT"

# Install WordPress.
status_message "Installing WordPress..."
wp core install \
  --title="${WORDPRESS_SITE_TITLE}" \
  --admin_user=${WORDPRESS_ADMIN_USER} \
  --admin_password=${WORDPRESS_ADMIN_PASSWORD} \
  --admin_email="example@example.com" \
  --skip-email \
  --url=${WORDPRESS_URL} \
  --quiet

# Activate our example plugin
status_message "Activating the plugin..."
wp plugin activate php-fun-plugin

echo -e "\n\nAccess the above install at:"
echo -e "$WORDPRESS_URL"
echo -e "Default username: $(action_format "$WORDPRESS_ADMIN_USER"), password: $(action_format "$WORDPRESS_ADMIN_PASSWORD")"
