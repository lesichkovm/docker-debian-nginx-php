FROM debian:9
MAINTAINER Milan Lesichkov <lesichkovm@gmail.com>

# Update package Repository
RUN apt-get update

# Nginx installation
RUN apt-get -y install nginx

# Nginx configuration
# RUN mkdir -p /var/www/html
# ADD nginx.conf /etc/nginx/

# Cleaning
RUN apt-get clean

# Expose nginx
EXPOSE 80/tcp
EXPOSE 443/tcp

CMD ["nginx", "-g", "daemon off;"]
