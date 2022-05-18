#! /bin/sh

set -e

export DATABASE_URL="mysql2://${CABINS_DB_USER}:${CABINS_DB_PASSWORD}@${CABINS_DB_HOST}:${CABINS_DB_PORT}/${CABINS_DB_NAME}?"

bundle exec rake db:migrate

if ruby db-is-empty.rb; then
  echo "seeding the DB"
  cat > db/seed/users.rb << EOF
User.create(
  name: '${CABINS_ADMIN_USERNAME}',
  email: '${CABINS_ADMIN_EMAIL}',
  password: '${CABINS_ADMIN_PASSWORD}',
  password_confirmation: '${CABINS_ADMIN_PASSWORD}',
  phone: '${CABINS_ADMIN_PHONE:=555-1212}',
  role: '${CABINS_ADMIN_ROLE:=planner}',
  admin: true
)
EOF
  bundle exec rake db:seed
fi

bundle exec rails s -p 3000 -b '0.0.0.0'
