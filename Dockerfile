FROM registry.gitlab.com/fnf/cabins-server:latest

MAINTAINER Casey Gerstle <gerstle@gmail.com>

# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /var/www/cabins
RUN mkdir -p $RAILS_ROOT

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

# Copy the main application
COPY . .

# gems
RUN gem install bundler
RUN bundle install

# assets
ENV RAILS_ENV production
RUN bundle exec rake assets:precompile
COPY public/ /usr/local/apache2/htdocs/
