#!/bin/sh
# Substitute environment variables in the HTML file
envsubst < /usr/share/nginx/html/index.html > /usr/share/nginx/html/index_substituted.html
mv /usr/share/nginx/html/index_substituted.html /usr/share/nginx/html/index.html

# Start nginx
exec "$@"