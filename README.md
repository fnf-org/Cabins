# CABINS

California Foundation for the Advancement of Electronic Arts cabins reservations system

overview
========

This is a ruby on rails app that has been containerized into a single image/container running an apache2 httpd web server
and a puma application server. Some static content is served via httpd, the ruby app is all served via puma. httpd is
exposed on port 80, puma is on 3000 but is not exposed. The non-app image is separated out into the cabins-server image
and app specific stuff is built on top of that image.

**TODO**: rip out all the legacy crap below and document the new shit. it's changing... a lot. I hope in a good way.

RUNNING locally
===============

1. docker run --name mysql -e MYSQL_ROOT_PASSWORD=\<PASSWORD\> -d -p 3306:3306 mysql:5.6
1. login to gitlab docker registry: `docker login registry.gitlab.com` (use an access token if you have 2fa setup)
1. `docker build --build-arg RAILS_ENV=development -t cabins .`
2. `cp example.cabins.env cabins-dev.env` and update by replacing all the `XXXXXX`'s with your values.
3. `docker run --rm -it -p 80:80 --env-file ./cabins-dev.env -v /home/cgerstle/src/cabins:/var/www/cabins --name cabins cabins`
4. `hit localhost:80`
5. for console `bin/rails console` from inside the container


# email previews
http://localhost/rails/mailers/user_mailer/
http://localhost/rails/mailers/reservation_mailer/
