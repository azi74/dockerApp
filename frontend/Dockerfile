FROM nginx:alpine

# Copy static website files
COPY index.html /usr/share/nginx/html/

# Install envsubst for environment variable substitution
RUN apk add --no-cache gettext

# Create a script to handle environment variable substitution
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]