#!/bin/bash

# Install PHP and required extensions
apt-get update && apt-get install -y php8.1 php8.1-cli php8.1-common php8.1-curl php8.1-mbstring php8.1-mysql php8.1-xml

# Install Composer
EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php

# Run your build commands
composer install --no-dev --optimize-autoloader
npm install
npm run production