FROM debian:9
MAINTAINER Milan Lesichkov <lesichkovm@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Update package Repository
RUN apt-get update

# Main package installation
RUN apt-get -y install supervisor php-cgi mysql-server php-mysql 

# Extra package installation
RUN apt-get -y install php-gd php-apcu php-mcrypt php-cli php-fpm php-curl php-pear

# Nginx installation
RUN apt-get -y install nginx

# Nginx configuration
# RUN mkdir -p /var/www/html
# ADD nginx.conf /etc/nginx/


# PHP FastCGI script
ADD php-fcgi /usr/local/sbin/
RUN chmod o+x /usr/local/sbin/php-fcgi

# Cleaning
RUN apt-get clean

# Expose nginx
EXPOSE 80/tcp
EXPOSE 443/tcp

# CMD ["nginx", "-g", "daemon off;"]
CMD ["supervisord"]
