#!/bin/bash
if ! command -v php &> /dev/null
then
    echo "PHP could not be found. Please install PHP and try again."
    exit 1
fi

php artisan serve --host=0.0.0.0 --port=80