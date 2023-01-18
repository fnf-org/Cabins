#! /bin/sh

set -e

# Source the environment from the runtime.
if [ -f /runtime/config ]; then 
    . /runtime/config
fi

# Run the app
bundle exec rails s -p 3000 -b '0.0.0.0'
