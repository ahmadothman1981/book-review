#!/bin/bash

# Locate PHP executable
PHP_PATH=$(command -v php)

if [ -z "$PHP_PATH" ]
then
    echo "PHP could not be found. Please install PHP and try again."
    exit 1
fi

# Start Laravel application
$PHP_PATH artisan serve --host=0.0.0.0 --port=80