FROM registry.gitlab.com/fnf/cabins-server:latest

MAINTAINER Casey Gerstle <gerstle@gmail.com>

# Set an environment variable where the Rails app is installed to inside of Docker image:
ARG RAILS_ENV=production
ENV RAILS_ROOT /var/www/cabins
RUN mkdir -p $RAILS_ROOT

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

# gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install

# assets
COPY ./app/assets $RAILS_ROOT/app/assets
COPY ./config $RAILS_ROOT/config
COPY Rakefile $RAILS_ROOT/Rakefile
RUN bundle exec rake assets:precompile RAILS_ENV=$RAILS_ENV
RUN cp -r $RAILS_ROOT/public/* /usr/local/apache2/htdocs/

# if we're in dev mode, tell apache to not serve the assets and to not redirect to https
# default to production
ADD apache-proxy-setup.sh /apache-proxy-setup.sh
RUN chmod 0755 /apache-proxy-setup.sh
RUN export RAILS_ENV=$RAILS_ENV; /apache-proxy-setup.sh && rm /apache-proxy-setup.sh

# Copy the main application
COPY . .
