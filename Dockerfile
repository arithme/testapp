# Use the official Nginx image from the Docker Hub
FROM nginx:alpine

# Remove the default Nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy the static HTML file to the Nginx web directory
COPY testapp /usr/share/nginx/html/
RUN rm -rf nginx.conf
COPY app.conf /etc/nginx/conf.d
COPY nginx.conf /etc/nginx
# Update the user in the Nginx configuration
RUN sed -i 's/user www-data;/user nginx;/' /etc/nginx/nginx.conf
# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx when the container has started
CMD ["nginx", "-g", "daemon off;"]
