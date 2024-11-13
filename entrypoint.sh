#!/bin/sh

# Load variables from .env file if it exists
if [ -f .env ]; then
  export $(cat .env | xargs)
fi

# Jalankan perintah yang diberikan
exec "$@"
