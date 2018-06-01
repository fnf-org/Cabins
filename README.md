# CABINS

California Foundation for the Advancement of Electronic Arts cabins reservations system

overview
========

This is a ruby on rails app that has been containerized into a single image/container running an apache2 httpd web server
and a puma application server. Some static content is served via httpd, the ruby app is all served via puma. httpd is
exposed on port 80, puma is on 3000 but is not exposed. The non-app image is separated out into the cabins-server image
and app specific stuff is built on top of that image.

**TODO**: rip out all the legacy crap below and document the new shit. it's changing... a lot. I hope in a good way.

LEGACY BELOW HERE
==================

# local dev
1. install docker & docker-compose: https://docs.docker.com/compose/install/
2. To set the environment variable in the docker-compose file, create a `.env` file w/ ```MYSQL_ROOT_PASSWORD=<YOUR MYSQL PASSWORD>```
3. `mv example.cabins.env cabins-dev.env` & replace all the `XXXXXX`'s with your values.
4. make sure `ProxyPass /assets` is commented out in conf/httpd-vhosts.conf
5. run `docker-compose -f ./docker-compose-local.yml build`
6. run `docker-compose -f ./docker-compose-local.yml up`
7. open separate terminal
8. `docker-compose exec --user "$(id -u):$(id -g)" app rake db:reset`
9. `docker-compose exec --user "$(id -u):$(id -g)" app rake db:migrate`

# image build & publish
1. git tag -a -m "release 1.1.0" 1.1.0
2. update `cabins.env` for prod
3. `sudo rm -rf tmp && rm -rf public/assets && RAILS_ENV=production bundle exec rake assets:precompile`
4. make sure `ProxyPass /assets` is set in conf/httpd-vhosts.conf
5. docker build -t cabins .
6. docker image ls
7. docker tag <image hash> gerstle/cabins:latest
8. docker tag <image hash> gerstle/cabins:1.1.0
9. docker login
10. docker push gerstle/cabins

# simple ec2 instance deployment
1. docker-machine create --driver amazonec2 --amazonec2-region us-west-1 --amazonec2-instance-type t2.micro --amazonec2-zone "b" cabins-dev
2. (alternatively) docker-machine start/restart/stop cabins-dev
3. docker-machine env cabins-dev
4. eval $(docker-machine env cabins-dev)
5. docker image pull gerstle/cabins
6. docker-compose build (needed for web)
7. docker-compose up -d
8. docker-compose logs -f -t

prod...
1. update `cabins.env` for prod
2. docker-machine env cabins-prod
3. eval $(docker-machine env cabins-prod)
4. docker image pull gerstle/cabins
5. docker-compose build (needed for web)
6. docker-compose up -d

# email previews
http://localhost/rails/mailers/user_mailer/
http://localhost/rails/mailers/reservation_mailer/