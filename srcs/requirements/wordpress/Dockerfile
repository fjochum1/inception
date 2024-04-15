# Set the image to Debian Bullseye
FROM debian:bullseye

# Update the package lists and install php and mariadb-client
RUN apt-get update && \
	apt-get install -y ca-certificates wget && \
	update-ca-certificates
RUN apt-get install -y php7.4 php-fpm php-mysql mariadb-client

# Create the directory for the website
RUN mkdir -p /var/www/html

# Change the ownership of the directory to root
RUN chown -R root:root /var/www/html

# Copy the configuration files
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod 755 /etc/php/7.4/fpm/pool.d/www.conf

# Copy the script to configure the website
COPY ./tools/wp_conf.sh /usr/local/bin/wp_conf.sh
RUN chmod 755 /usr/local/bin/wp_conf.sh

# Create the directory for the php-fpm socket
RUN mkdir /run/php #

# Download and extract the latest version of WordPress
RUN wget --no-check-certificate https://wordpress.org/wordpress-6.2.2.tar.gz -P /var/www/html
RUN cd /var/www/html && tar -xzf wordpress-6.2.2.tar.gz && rm wordpress-6.2.2.tar.gz

# Download and install WP-CLI (WordPress Command Line Interface)
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Set the working directory
WORKDIR /var/www/html/wordpress

# Expose the port
EXPOSE 9000

# Run the script to configure the website
ENTRYPOINT ["/usr/local/bin/wp_conf.sh"]
