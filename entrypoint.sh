#! /bin/sh

set -e

export DATABASE_URL="mysql2://${CABINS_DB_USER}:${CABINS_DB_PASSWORD}@${CABINS_DB_HOST}:${CABINS_DB_PORT}/${CABINS_DB_NAME}?"

bundle exec rake db:migrate
bundle exec rails s -p 3000 -b '0.0.0.0'
