FROM debian:bullseye

# Update the package lists and install Nginx and OpenSSL
RUN apt -y update && apt install -y nginx openssl

# Generate a self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=MO/L=KH/O=42/OU=student/CN=${DOMAIN_NAME}"

# Port
EXPOSE 443

# Copy the Nginx configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]



